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

// TODO: TO BE COMPLETED

<form:form action="sponsorship/sponsor/edit.do" modelAttribute="sponsorship">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="sponsor"/> 
	
	<form:label path="bannerURL">
		<spring:message code="sponsorship.bannerURL" />:
	</form:label>
	<form:input path="bannerURL" />
	<form:errors cssClass="error" path="bannerURL" />
	<br />
	
	<form:label path="link">
		<spring:message code="sponsorship.link" />:
	</form:label>
	<form:input path="link" />
	<form:errors cssClass="error" path="link" />
	<br />
	
	
	
	<!-- botones --> 
	
	<input type="submit" name="save"
		value="<spring:message code="sponsorship.save"/>" />&nbsp;
		
	<jstl:if test="${sponsorship.id !=0 }">
		<input type="submit" name="delete"
			value="<spring:message code="sponsorship.delete"/>"
			onclick="javascript: return confirm('<spring:message code="sponsorship.confirm.delete"/>')" />&nbsp;
	</jstl:if>
	
	<input type="button" name="cancel"
		value="<spring:message code="sponsorship.cancel"/>"
		onclick="javascript: window.location.replace('sponsorship/sponsor/list.do')" />
	<br />
	
</form:form>