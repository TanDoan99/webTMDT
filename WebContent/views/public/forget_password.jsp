<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row">
<%@include file="/templates/public/assets/inc/sidebar.jsp" %>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">FORGOT YOUR PASSWORD</li>
    </ul>
	<div class="well well-small">
	<h3> FORGOT YOUR PASSWORD</h3>	
	<hr class="soft"/>
	
	Please enter the e-mail address used to register. We will e-mail you your new password.<br/><br/><br/>
	
	
	<form class="form-inline">
		<label class="control-label" for="inputEmail">E-mail address</label>
		<input type="text" class="span4" placeholder="Email">			  
		<button type="submit" class="shopBtn block">Send My Password</button>
	</form>
</div>
</div>
</div>

<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>