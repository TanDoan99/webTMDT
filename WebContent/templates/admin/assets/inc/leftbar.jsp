<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%
    	if(session.getAttribute("userInfo")!=null){
    %>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li class="text-center">
                <img src="<%=request.getContextPath()%>/templates/admin/assets/img/IMG_0309.jpg" class="user-image img-responsive" />
            </li>
            <li>
                <a id="index" href="<%=request.getContextPath() %>/admin/index"><i class="fa fa-dashboard fa-3x"></i> Trang chủ</a>
            </li>
            <li>
                <a id="category" href="<%=request.getContextPath() %>/admin/cat/index"><i class="fa fa-list fa-3x"></i> Quản lý danh mục</a>
            </li>
            <li>
                <a id="jewelry" href="<%=request.getContextPath() %>/admin/jewelry"><i class="fa fa-th-large fa-3x"></i> Quản lý sản phẩm</a>
            </li>
            <li>
                <a id="user" href="<%=request.getContextPath() %>/admin/user"><i class="fa fa-user fa-3x"></i> Quản lý người dùng</a>
            </li>
            <li>
                <a id="contact" href="<%=request.getContextPath() %>/admin/contact"><i class="fa fa-envelope fa-3x"></i> Quản lý liên hệ</a>
            </li>
            <li>
                <a id="comment" href="<%=request.getContextPath() %>/admin/cart"><i class="fa fa-shopping-cart fa-3x"></i> Quản lý giỏ hàng</a>
            </li>
            <li>
                <a id="comment" href="<%=request.getContextPath() %>/admin/comment"><i class="fa fa-comment fa-3x"></i> Quản lý bình luận</a>
            </li>
        </ul>
    </div>
</nav>
<%} %>
<!-- /. NAV SIDE  -->