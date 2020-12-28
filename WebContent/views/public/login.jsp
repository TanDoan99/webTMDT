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
		<li class="active">Login</li>
    </ul>
	<h3 style="color: #fff;"> Login</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			<h5>CREATE YOUR ACCOUNT</h5><br/>
			Enter your e-mail address to create an account.<br/><br/><br/>
			<form>
			  <div class="control-group">
				<label class="control-label" for="inputEmail">E-mail address</label>
				<div class="controls">
				  <input class="span3"  type="text" placeholder="Email">
				</div>
			  </div>
			  <div class="controls">
			 <button type="submit" class="btn block"> <a href="<%=request.getContextPath() %>/register_index">Create Your Account</a></button>
			  </div>
			</form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			<h5>ALREADY REGISTERED ?</h5>
			 <%
								if("OK".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Đăng kí thành công!
							</div>
		<%} 
									if("err".equals(msg)) {
								%>
                           		 <div class="alert alert-danger" role="alert">
	 							 Sai tên đăng nhập hoặc mật khẩu!
								</div>
								<%} %>
			<form action="<%=request.getContextPath() %>/auth/login_index" method="post">
			  <div class="control-group">
				<label class="control-label" for="inputEmail">User name</label>
				<div class="controls">
				  <input class="span3"  type="text" name="username" placeholder="user name">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
				  <input type="password" class="span3" name="password" placeholder="Password">
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" style="color: green;" class="defaultBtn">Sign in</button> <a href="#">Forget password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/register_index">Register</a>
				</div>
			  </div>
			</form>
		</div>
		</div>
	</div>	
	
</div>
</div>

<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>