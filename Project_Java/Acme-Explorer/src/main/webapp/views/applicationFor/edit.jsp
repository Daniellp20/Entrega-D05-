<%--
 * edit.jsp
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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="applicationFor/explorer/edit.do" modelAttribute="applicationFor">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="explorer"/>
	<form:hidden path="manager"/>
	<form:hidden path="reasonWhy"/>

	<form:label path="moment">
		<spring:message code="event.moment" />:
	</form:label>
	<form:input path="moment" placeholder=" yyyy/dd/MM HH:hh" />
	<form:errors cssClass="error" path="moment" />
	<br />
	
	<form:label path="trip">
		<spring:message code="applicationFor.trip" />:
	</form:label>
	<form:select id="trips" path="trip" onchange="javascript: reloadExams()">
		<form:option value="0" label="----" />		
		<form:options items="${trips}" itemValue="id"
			itemLabel="title" />
	</form:select>
	<form:errors cssClass="error" path="trip" />
	<br />
	
	<form:label path="status">
		<spring:message code="applicationFor.status" />:
	</form:label>
	<form:select id="status" path="status">
		<form:option value="PENDING" label="PENDING" />
	</form:select>
	<br />
	<form:label path="creditCard">
		<spring:message code="creditcard" />:
	</form:label>
	<br />
	<form:label path="holderName">
		<spring:message code="holderName" />:
	</form:label>
	<form:input path="holderName" />
	<%-- <form:errors cssClass="error" path="holderName" /> --%>
	<br />
	<form:label path="brandName">
		<spring:message code="brandName" />:
	</form:label>
	<form:input path="brandName" />
	<%-- <form:errors cssClass="error" path="brandName" /> --%>
	<br />
	<form:label path="number">
		<spring:message code="number" />:
	</form:label>
	<form:input path="number" />
	<%-- <form:errors cssClass="error" path="number" /> --%>
	<br />
	<form:label path="expirationMonth">
		<spring:message code="expirationMonth" />:
	</form:label>
	<form:input path="expirationMonth" />
	<%-- <form:errors cssClass="error" path="expirationMonth" /> --%>
	<br />
	<form:label path="expirationYear">
		<spring:message code="expirationYear" />:
	</form:label>
	<form:input path="expirationYear" />
	<%-- <form:errors cssClass="error" path="expirationYear" /> --%>
	<br />
	<form:label path="cvv">
		<spring:message code="cvv" />:
	</form:label>
	<form:input path="cvv" />
	<%-- <form:errors cssClass="error" path="cvv" /> --%>
	<br />

	<input type="submit" name="save"
		value="<spring:message code="applicationFor.save" />" />&nbsp; 
	<jstl:if test="${applicationFor.id != 0}">
		<input type="submit" name="delete"
			value="<spring:message code="applicationFor.delete" />"
			onclick="return confirm('<spring:message code="applicationFor.confirm.delete" />')" />&nbsp;
	</jstl:if>
	<input type="button" name="cancel"
		value="<spring:message code="applicationFor.cancel" />"
		onclick="javascript: relativeRedir('applicationFor/explorer/list.do');" />
	<br />
</form:form>
