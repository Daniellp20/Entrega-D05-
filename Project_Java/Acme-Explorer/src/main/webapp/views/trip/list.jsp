<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing trips -->

<form:form action="trip/list.do" modelAttribute="trip">

	<form:label path="ticker">
		<spring:message code="trip.ticker" />:
	</form:label>
	<form:input path="ticker" />
	
	<form:label path="title">
		<spring:message code="trip.title" />:
	</form:label>
	<form:input path="title" />
		
	<form:label path="trip.description" var="description">
		<spring:message code="trip.description" />:
	</form:label>
	<form:input path="description" />
	
	<%-- 
	<spring:url value="applicationFor/manager/edit.do" var="editlink">
	<spring:param name="ticker" value="ticker" />
	<spring:param name="title" value="title" />
	<spring:param name="description" value="description" />
		</spring:url>
		<a href="${editlink}"><spring:message code="applicationfor.edit" /></a>
	 --%>
	
	<input type="submit" name="search"
		value="<spring:message code="trip.search"/>" />&nbsp;
		
</form:form>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="trips" requestURI="${requestURI}" id="row">

	<display:column>
		<spring:url value="trip/display.do"
			var="displaydURL">
			<spring:param name="tripId" value="${row.id}" />
		</spring:url>
		<a href="${displayURL}"><spring:message
				code="trip.display" /></a>
	</display:column>
	
	<security:authorize access="hasRole('MANAGER')">
		<jstl:if test="${publicated==false}">
			<display:column>
				<spring:url value="trip/manager/edit.do"
					var="editURL">
					<spring:param name="tripId" value="${row.id}" />
				</spring:url>
				<a href="${editURL}"><spring:message
						code="trip.edit" /></a>
			</display:column>
		</jstl:if>
		</security:authorize>
	
	
	
	<!-- Attributes -->
	<spring:message code="trip.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />
	
	<spring:message code="trip.price" var="priceHeader" />
	<display:column property="price" title="${priceHeader}" sortable="true" />
	
	<spring:message code="trip.startDate" var="startDateHeader" />
	<display:column property="startDate" title="${startDateHeader}" sortable="true" />
	
	<spring:message code="trip.finishDate" var="finishDateHeader" />
	<display:column property="finishDate" title="${finishDateHeader}" sortable="true" />
	
	<display:column>
		<spring:url value="ranger/list.do" var="rangerListURL">
		<spring:param name="tripId" value="${row.id}"/>
		</spring:url>
		<a href="${rangerListURL}"><spring:message code="trip.ranger"/></a>
	</display:column>
	
	<display:column>
		<spring:url value="auditRecord/list.do" var="auditRecordListURL">
		<spring:param name="tripId" value="${row.id}"/>
		</spring:url>
		<a href="${auditRecordListURL}"><spring:message code="trip.auditRecord"/></a>
	</display:column>
	
	
	
</display:table>

<security:authorize access="hasRole('MANAGER')">
	<div>
		<a href="trip/manager/create.do"> <spring:message
				code="trip.create" />
		</a>
	</div>
</security:authorize>