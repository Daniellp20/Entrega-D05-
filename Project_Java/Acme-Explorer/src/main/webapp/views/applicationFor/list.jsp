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
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

// TODO: TO BE COMPLETED
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="applicationFor" requestURI="applicationFor/auditor/list.do"
	id="row">

	<spring:message code="applicationfor.moment" var="moment"/>
	<display:column property="moment" title="${moment}" sortable="true" />
	<spring:message code="applicationfor.status" var="status" />
	<display:column property="status" title="${status}" sortable="true" />
	<spring:message code="applicationfor.reason" var="reasonWhy" />
	<display:column property="reasonWhy" title="${reasonWhy}" sortable="true" />
	<spring:message code="applicationfor.creditcard" var="creditCard" />
	<display:column property="creditCard" title="${creditCard}" sortable="true" />

	<display:column>
		<spring:url value="applicationFor/manager/edit.do" var="editlink">
			<spring:param name="applicationForId" value="${row.id}" />
		</spring:url>
		<a href="${editlink}"><spring:message code="applicationfor.edit" /></a>
	</display:column>

</display:table>

<security:authorize access="hasRole('CUSTOMER')">
	<spring:url value="applicationFor/explorer/edit.do" var="linkcreate" />
	<a href="${linkcreate}"><spring:message code="applicationfor.create" /></a>
</security:authorize>