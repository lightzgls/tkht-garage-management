<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%
    final HttpSession currentSession = session;
    class PartDetailsUI2 {
        private SparePart2 selectedPart;

        public void loadDetails() {
            selectedPart = (SparePart2) currentSession.getAttribute("selectedPart");
            if (selectedPart == null) { response.setStatus(404); }
        }
    }
    PartDetailsUI2 ui = new PartDetailsUI2();
    ui.loadDetails();
    request.setAttribute("selectedPart", ui.selectedPart);
    request.setAttribute("title", "Spare Part Details");
%>
<%@ include file="WEB-INF/header.jspf" %>
<c:url var="back" value="SearchServicesPartsUI2.jsp"><c:param name="searchType" value="${sessionScope.searchType}"/><c:param name="keyword" value="${sessionScope.keyword}"/><c:param name="page" value="${sessionScope.page}"/></c:url>
<a id="back" href="<c:out value='${back}'/>">Back</a>
<h1>Spare Part Details</h1>
<c:choose><c:when test="${not empty selectedPart}">
<fmt:setLocale value="vi_VN"/>
<table id="tblInformation">
    <thead><tr><th>Information</th><th>Value</th></tr></thead>
    <tbody>
    <tr><td>Spare Part Code</td><td><c:out value="${selectedPart.code}"/></td></tr>
    <tr><td>Spare Part Name</td><td><c:out value="${selectedPart.name}"/></td></tr>
    <tr><td>Image</td><td>
        <c:choose>
            <c:when test="${empty selectedPart.img}">Chưa có ảnh minh họa</c:when>
            <c:otherwise><img class="part-image" src="<c:out value='${selectedPart.img}'/>" alt="<c:out value='${selectedPart.name}'/>" width="200"></c:otherwise>
        </c:choose>
    </td></tr>
    <tr><td>Compatibility Note</td><td><c:out value="${selectedPart.compatibilityNote}"/></td></tr>
    <tr><td>Selling Price (VND)</td><td class="numeric"><fmt:formatNumber value="${selectedPart.sellingPrice}" maxFractionDigits="0"/></td></tr>
    <tr><td>Status</td><td><c:out value="${selectedPart.status}"/></td></tr>
    </tbody>
</table>
</c:when><c:otherwise><p role="alert">Vui lòng chọn phụ tùng từ danh sách tìm kiếm.</p></c:otherwise></c:choose>
<%@ include file="WEB-INF/footer.jspf" %>
