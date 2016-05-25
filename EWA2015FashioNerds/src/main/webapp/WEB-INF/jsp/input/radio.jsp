<%-- 
    Document   : text
    Created on : 7-dec-2015, 22:18:10
    Author     : Bert
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<spring:bind path="data">
    <ul class="multi-input user-input-${category.getId()}"> 
        <c:forEach items="${category.getData()}" var="dataItem">  
            <li>
                <form:checkbox data-group="${category.getId()}-${tab.getId()}" class="function-radio" path="data" id="data-sel-${categoryIndex}-${tabIndex}-${dataItem.getId()}" value="${dataItem.getId()}"/>
                <label for="data-sel-${categoryIndex}-${tabIndex}-${dataItem.getId()}"><c:out value="${dataItem.getValue()}" />
                    <c:choose>
                        <c:when test="${(category.isReviewRequired() && !dataItem.isReviewed())}">
                            <img class="logo" title="Value must be reviewed" src="<c:url value="/resources/images/flag_r.png" />" alt="Must be reviewed" />
                        </c:when>
                        <c:when test="${(category.isReviewRequired() && dataItem.isReviewed())}">
                            <img class="logo" title="Value is reviewed" src="<c:url value="/resources/images/flag_g.png" />" alt="OK" />
                        </c:when>  
                    </c:choose>
                </label>

            </li>
        </c:forEach>
    </ul>
    <form:errors path="data" class="error" /> 
</spring:bind> 