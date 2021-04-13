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
		<li class="active">Registration</li>
    </ul>
	<h3 style="color: #fff;"> Registration</h3>	
	<hr class="soft"/>
	<div class="well">
	<form class="form-horizontal"method="post">
		<h3>Your Personal Details</h3>
		 <div class="control-group">
			<label class="control-label" for="inputLname">Full name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="fullname" name="fullname" placeholder="full Name">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLname"> Name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="inputLname" name="username" placeholder="Name">
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
		<div class="controls">
		  <input type="text" name="email" placeholder="Email">
		</div>
	  </div>	 
	  <div class="control-group"> 
		<label class="control-label">Password <sup>*</sup></label>
		<div class="controls">
		  <input type="password" name="password" placeholder="Password">
		</div>
		</div>
	 	 <div class="control-group">  
		<label class="control-label">Address <sup>*</sup></label>
		<div class="controls">
		  <input type="text" name="address" placeholder="address">
		</div>
		</div>
	     <div class="control-group">
		<label class="control-label">Telephone <sup>*</sup></label>
		<div class="controls">
		  <input type="text" name="telephone_number" placeholder="telephone">
		</div>
		</div><br/>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Register" class="exclusive shopBtn">
		</div>
	</div>
	</form>
</div>

<div class="well">
	<form class="form-horizontal" >
		<h3>Your Billing Details</h3>
		<div class="control-group">
			<label class="control-label">Fiels label <sup>*</sup></label>
			<div class="controls">
			  <input type="text" placeholder=" Field name">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Fiels label <sup>*</sup></label>
			<div class="controls">
			  <input type="text" placeholder=" Field name">
			</div>
		</div>
		 <div class="control-group">
			<label class="control-label">Fiels label <sup>*</sup></label>
			<div class="controls">
			  <input type="text" placeholder=" Field name">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Fiels label <sup>*</sup></label>
			<div class="controls">
			  <textarea></textarea>
			</div>
		</div>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="Register" class="shopBtn exclusive">
		</div>
	</div>
	</form>
</div>

</div>
</div>
<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>