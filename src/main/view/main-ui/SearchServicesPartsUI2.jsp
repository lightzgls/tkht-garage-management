<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%
    final HttpSession currentSession = session;
    class SearchServicesPartsUI2 {
        private String searchType = "Service";
        private String keyword = "";
        private int page = 1;
        private List<Service2> services = new ArrayList<>();
        private List<SparePart2> spareParts = new ArrayList<>();
        private boolean hasNext;

        public void searchClicked() throws SQLException {
            if (page < 1 || !("Service".equals(searchType) || "Part".equals(searchType))) {
                throw new IllegalArgumentException("Loại tìm kiếm hoặc số trang không hợp lệ.");
            }
            if ("Service".equals(searchType)) {
                try (ServiceDAO2 dao = new ServiceDAO2()) {
                    services = dao.getServicesByName(keyword, page);
                    hasNext = services.size() == 20 && page < Integer.MAX_VALUE
                            && !dao.getServicesByName(keyword, page + 1).isEmpty();
                }
            } else {
                try (SparePartDAO2 dao = new SparePartDAO2()) {
                    spareParts = dao.getSparePartsByName(keyword, page);
                    hasNext = spareParts.size() == 20 && page < Integer.MAX_VALUE
                            && !dao.getSparePartsByName(keyword, page + 1).isEmpty();
                }
            }
            currentSession.setAttribute("services", services);
            currentSession.setAttribute("spareParts", spareParts);
            currentSession.setAttribute("searchType", searchType);
            currentSession.setAttribute("keyword", keyword);
            currentSession.setAttribute("page", page);
            currentSession.removeAttribute("selectedService");
            currentSession.removeAttribute("selectedPart");
        }

        public boolean ViewDetails(String code) throws java.io.IOException {
            String loadedType = (String) currentSession.getAttribute("searchType");
            if ("Service".equals(loadedType)) {
                List<Service2> loaded = (List<Service2>) currentSession.getAttribute("services");
                if (loaded != null) {
                    for (Service2 item : loaded) {
                        if (item.getCode().equals(code)) {
                            currentSession.setAttribute("selectedService", item);
                            response.sendRedirect("ServiceDetailsUI2.jsp");
                            return true;
                        }
                    }
                }
            } else if ("Part".equals(loadedType)) {
                List<SparePart2> loaded = (List<SparePart2>) currentSession.getAttribute("spareParts");
                if (loaded != null) {
                    for (SparePart2 item : loaded) {
                        if (item.getCode().equals(code)) {
                            currentSession.setAttribute("selectedPart", item);
                            response.sendRedirect("PartDetailsUI2.jsp");
                            return true;
                        }
                    }
                }
            }
            response.setStatus(404);
            request.setAttribute("error", "Không tìm thấy lựa chọn trong danh sách hiện tại. Vui lòng tìm lại.");
            return false;
        }
    }
    SearchServicesPartsUI2 ui = new SearchServicesPartsUI2();
    if (request.getParameter("searchType") != null) { ui.searchType = request.getParameter("searchType"); }
    if (request.getParameter("keyword") != null) { ui.keyword = request.getParameter("keyword"); }
    boolean searched = request.getParameter("keyword") != null;
    if ("ViewDetails".equals(request.getParameter("action"))) {
        if (ui.ViewDetails(request.getParameter("code"))) { return; }
        searched = false;
    } else if (searched) {
        try {
            ui.page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
            ui.searchClicked();
        } catch (IllegalArgumentException error) {
            response.setStatus(400);
            request.setAttribute("error", "Loại tìm kiếm hoặc số trang không hợp lệ.");
        } catch (SQLException error) {
            application.log("SearchServicesPartsUI2.searchClicked() failed", error);
            response.setStatus(503);
            request.setAttribute("error", "Không thể tải dữ liệu. Vui lòng nhấn Search để thử lại.");
        }
    }
    request.setAttribute("searchType", ui.searchType);
    request.setAttribute("keyword", ui.keyword);
    request.setAttribute("page", ui.page);
    request.setAttribute("services", ui.services);
    request.setAttribute("spareParts", ui.spareParts);
    request.setAttribute("hasNext", ui.hasNext);
    request.setAttribute("searched", searched);
    request.setAttribute("title", "Search Services / Spare Parts");
%>
<%@ include file="WEB-INF/header.jspf" %>
<a id="back" href="MainUI2.jsp">Back</a>
<h1>Search Services / Spare Parts</h1>
<form class="search-form" action="SearchServicesPartsUI2.jsp" method="get">
    <label for="keyword">Keyword: <input id="keyword" name="keyword" value="<c:out value='${keyword}'/>"></label>
    <select id="searchType" name="searchType" aria-label="Search type">
        <option value="Service" ${searchType eq 'Service' ? 'selected' : ''}>Service</option>
        <option value="Part" ${searchType eq 'Part' ? 'selected' : ''}>Spare Part</option>
    </select>
    <button id="btnSearch" type="submit">Search</button>
</form>
<c:if test="${not empty error}"><p role="alert"><c:out value="${error}"/></p></c:if>
<h2>Search Results:</h2>
<fmt:setLocale value="vi_VN"/>
<table id="tblResults">
    <thead><tr><th class="ordinal">No.</th><th>Code</th><th>Name</th><th class="numeric">${searched ? 'Price (VND)' : 'Price'}</th><th>Status</th></tr></thead>
    <tbody>
    <c:forEach items="${searchType eq 'Service' ? services : spareParts}" var="item" varStatus="row">
        <c:url var="detailsUrl" value="SearchServicesPartsUI2.jsp"><c:param name="action" value="ViewDetails"/><c:param name="code" value="${item.code}"/></c:url>
        <tr data-code="<c:out value='${item.code}'/>">
            <td class="ordinal">${(page - 1) * 20 + row.count}</td><td><c:out value="${item.code}"/></td>
            <td class="linked"><a href="<c:out value='${detailsUrl}'/>" title="<c:out value='${item.name}'/>"><c:out value="${item.name}"/></a></td>
            <td class="numeric"><fmt:formatNumber value="${searchType eq 'Service' ? item.basePrice : item.sellingPrice}" maxFractionDigits="0"/></td>
            <td><c:out value="${item.status}"/></td>
        </tr>
    </c:forEach>
    <c:if test="${not searched}"><c:forEach begin="1" end="2"><tr class="blank"><td></td><td></td><td></td><td></td><td></td></tr></c:forEach></c:if>
    </tbody>
</table>
<c:if test="${searched and empty services and empty spareParts and empty error}"><p>Không tìm thấy kết quả phù hợp.</p></c:if>
<c:if test="${page gt 1 or hasNext}">
    <nav class="pagination" aria-label="Pagination">
        <c:if test="${page gt 1}"><c:url var="prevUrl" value="SearchServicesPartsUI2.jsp"><c:param name="searchType" value="${searchType}"/><c:param name="keyword" value="${keyword}"/><c:param name="page" value="${page - 1}"/></c:url><a href="<c:out value='${prevUrl}'/>">Previous</a></c:if>
        <span>Page ${page}</span>
        <c:if test="${hasNext}"><c:url var="nextUrl" value="SearchServicesPartsUI2.jsp"><c:param name="searchType" value="${searchType}"/><c:param name="keyword" value="${keyword}"/><c:param name="page" value="${page + 1}"/></c:url><a href="<c:out value='${nextUrl}'/>">Next</a></c:if>
    </nav>
</c:if>
<%@ include file="WEB-INF/footer.jspf" %>
