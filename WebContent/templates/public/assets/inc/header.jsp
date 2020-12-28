<%@page import="models.Cart"%>
<%@page import="models.User"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Twitter Bootstrap shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
   <link href="<%=request.getContextPath()%>/templates/public/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="<%=request.getContextPath()%>/templates/public/assets/css/style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="<%=request.getContextPath()%>/templates/public/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/templates/public/assets/ico/favicon.ico">
     <script type="text/javascript" charset="UTF-8" laguage="JavaScript" src="<%=request.getContextPath() %>/templates/public/assets/js/codemouse.js" ></script> 
  	
  </head>
<body>
<!-- 
	Upper Header Section 
-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				<%
					List<Cart> listCart=(List<Cart>)session.getAttribute("listCart");
				%>
				<a href="<%=request.getContextPath() %>/index.html"> <span class="icon-home"></span> Home</a> 
				 
				<a href="<%=request.getContextPath() %>/register_index"><span class="icon-edit"></span> Free Register </a> 
				<a href="<%=request.getContextPath() %>/contact"><span class="icon-envelope"></span> Contact us</a>
				<a href="<%=request.getContextPath() %>/cart"><span class="icon-shopping-cart"></span><span id="sizeCart"> <%if(listCart!=null) out.print(listCart.size());else out.print(0); %> </span> Item(s) - <span class="badge badge-warning"> $448.42</span></a>
				<a href="#"><span class="icon-user"></span> 
				<%
            	if(session.getAttribute("userInfo")!=null){
            		User user=(User)session.getAttribute("userInfo");
            	
            %>
            <div style="color: white;float: right;font-size: 16px;"> Xin chào, <b><%=user.getFullname()%></b> &nbsp; <a href="<%=request.getContextPath() %>/auth/logout_index" >Đăng xuất</a> </div>
        	<%}else{ %>
        	   <div style="color: white;float: right;font-size: 16px;"> Xin chào, <b>Người dùng</b> &nbsp; <a href="<%=request.getContextPath() %>/auth/login_index"  >Đăng nhập</a> </div>
        	<%} %>
				</a>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section 
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="<%=request.getContextPath() %>/index.html"><span>Twitter Bootstrap ecommerce template</span> 
		<img style="height: 61px;width: 301px;" src="<%=request.getContextPath()%>/templates/public/assets/img/your-logo.png" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
	<div class="offerNoteWrapper">
	<h1 class="dotmark">
	<img alt="" src="<%=request.getContextPath()%>/templates/public/assets/img/a1.jpg" />
	</h1>
	</div>
	</div>
	<div class="span4 alignR">
	<p><br> <strong style="color: #FA5858"> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	</div>
</div>
</header>
<!--
Navigation Bar Section 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
			  <li class="active"><a href="<%=request.getContextPath() %>/index.html">Home	</a></li>
			  <li class=""><a href="<%=request.getContextPath() %>/product_three_col">Three Column</a></li>
			  <li class=""><a href="<%=request.getContextPath() %>/product_four_col">Four Column</a></li>
			  <li class=""><a href="<%=request.getContextPath() %>/product">Product</a></li>
			</ul>
			<form method="get" action="<%=request.getContextPath()%>/index.html" class="navbar-search pull-left">
                <input value="<%if(request.getParameter("sname")!=null) out.print(request.getParameter("sname"));%>" type="search" class="form-control input-sm" placeholder="Nhập tên sản phẩm" name="sname" class="search-query span2" />
				  <select  name="scat"  class="btn-sm" style="width:150px; margin-right:20px;" >
                                        	<option value="0">-- Danh mục --</option>
                                        	<%
                                        		int scat = 0;
                             	if(request.getAttribute("scat")!=null){
                              		scat =(Integer) request.getAttribute("scat");
                             	}
                 				if(request.getAttribute("catList")!=null){
                          	           	List<Category> listCat=(List<Category>)request.getAttribute("catList");
                                        if(listCat.size()>0){
                                             for(Category cat:listCat){
                                        	%>
	                                       	<option <%if(scat==cat.getId()) out.print("selected");%> 
	                                       	value="<%=cat.getId()%>"><%=cat.getName()%></option>
	                                   		<%
	                                   			}
	                                   			                                   		                                        		}
	                                   			                                   		                                        	}
	                                   		%>
                                        </select>
				<input type="submit" style="margin: 0px ;margin-bottom: 10px;" name="search" value="Search" class="btn btn-warning btn-sm" /> 
			</form>
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="<%=request.getContextPath() %>/login_head"><span class="icon-lock"></span> Login <b class="caret"></b></a>
				<div class="dropdown-menu">
				 <%
								String msg = (String) request.getParameter("msg");
									if("err".equals(msg)) {
								%>
                           		 <div class="alert alert-danger" role="alert">
	 							 Sai tên đăng nhập hoặc mật khẩu!
								</div>
								<%} %>
				<form class="form-horizontal loginFrm"action="<%=request.getContextPath() %>/auth/login_index" method="post">
				  <div class="control-group">
					<input type="text" class="span2" id="inputUserName" name="username" placeholder="User name">
				  </div>
				  <div class="control-group">
					<input type="password" class="span2" id="inputPassword" name="password" placeholder="Password">
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					<button type="submit" style="color: green;" class="shopBtn btn-block"> Sign in</button>
				  </div>
				</form>
				</div>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>