<%@ page pageEncoding="UTF-8" %>
<%@ include file="WEB-INF/common.jspf" %>
<%
    final HttpSession currentSession = session;
    class ServiceDetailsUI2 {
        private Service2 selectedService;

        public void loadDetails() {
            selectedService = (Service2) currentSession.getAttribute("selectedService");
            if (selectedService == null) { response.setStatus(404); }
        }
    }
    ServiceDetailsUI2 ui = new ServiceDetailsUI2();
    ui.loadDetails();
    request.setAttribute("selectedService", ui.selectedService);
    request.setAttribute("title", "Service Details");
%>
<%@ include file="WEB-INF/header.jspf" %>
<c:url var="back" value="SearchServicesPartsUI2.jsp"><c:param name="searchType" value="${sessionScope.searchType}"/><c:param name="keyword" value="${sessionScope.keyword}"/><c:param name="page" value="${sessionScope.page}"/></c:url>
<a id="back" href="<c:out value='${back}'/>">Back</a>
<h1>Service Details</h1>
<c:choose><c:when test="${not empty selectedService}">
<fmt:setLocale value="vi_VN"/>
<table id="tblInformation">
    <thead><tr><th>Information</th><th>Value</th></tr></thead>
    <tbody>
    <tr><td>Service Code</td><td><c:out value="${selectedService.code}"/></td></tr>
    <tr><td>Service Name</td><td><c:out value="${selectedService.name}"/></td></tr>
    <tr><td>Description</td><td><c:out value="${selectedService.description}"/></td></tr>
    <tr><td>Base Price (VND)</td><td class="numeric"><fmt:formatNumber value="${selectedService.basePrice}" maxFractionDigits="0"/></td></tr>
    <tr><td>Estimated Duration</td><td>${selectedService.estimatedDuration} minutes</td></tr>
    <tr><td>Status</td><td><c:out value="${selectedService.status}"/></td></tr>
    </tbody>
</table>
</c:when><c:otherwise><p role="alert">Vui lòng chọn dịch vụ từ danh sách tìm kiếm.</p></c:otherwise></c:choose>
<%@ include file="WEB-INF/footer.jspf" %>
