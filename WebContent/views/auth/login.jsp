<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
      <link rel="icon" type="image/jpg" href="<%=request.getContextPath()%>/templates/admin/assets/img/logo-su-tu.jpg"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
  <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=request.getContextPath() %>/index.html">Home</a>
            </div>
            <%
            	if(session.getAttribute("userInfo")!=null){
            		User user=(User)session.getAttribute("userInfo");
            	
            %>
            <div style="color: white;padding: 15px 50px 5px 20px;float: right;font-size: 16px;"> Xin chào, <b><%=user.getFullname()%></b> &nbsp; <a href="<%=request.getContextPath() %>/auth/logout" class="btn btn-danger square-btn-adjust">Đăng xuất</a> </div>
        	<%}else{ %>
        	   <div style="color: white;padding: 15px 50px 5px 20px;float: right;font-size: 16px;"> Xin chào, <b>Người dùng</b> &nbsp; <a href="<%=request.getContextPath() %>/auth/login" class="btn btn-danger square-btn-adjust">Đăng nhập</a> </div>
        	<%} %>
        </nav>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
			 <%
                          		  String msg = (String) request.getParameter("msg");
									if("err".equals(msg)) {
							%>
                           		 <div class="alert alert-danger" role="alert">
	 							 Sai tên đăng nhập hoặc mật khẩu!
								</div>
								<%} %>
				<form method="post"  id="form" action="<%=request.getContextPath()%>/auth/login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" value="${username}" name="username" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="password" placeholder="password">
					</div>
					<div class="form-group">
						<button type="submit" name="submit" class="btn float-right login_btn">Login</button>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<style>

	@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://img2.goodfon.com/wallpaper/big/8/ae/duhi-flakon-ozherele-tkan.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 450px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}
h3{
color: #fff;
}
.remember{
color: #fff;
}
.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}
</style>