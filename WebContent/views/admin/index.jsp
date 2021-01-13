﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>TRANG QUẢN TRỊ VIÊN</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
        	<%
        		int countCat=Integer.parseInt(String.valueOf(request.getAttribute("countCat")));
        		int countSong=Integer.parseInt(String.valueOf(request.getAttribute("countSong")));
        		int countUser=Integer.parseInt(String.valueOf(request.getAttribute("countUser")));
        		int countContact=Integer.parseInt(String.valueOf(request.getAttribute("countContact")));
        		int countComment=Integer.parseInt(String.valueOf(request.getAttribute("countComment")));
        	%>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bars"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/cat/index" title="">Quản lý danh mục</a></p>
                        <p class="text-muted">Có <%=countCat %> danh mục</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-bell-o"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/jewelry" title="">Quản lý sản phẩm</a></p>
                        <p class="text-muted">Có <%=countSong %> sản phẩm</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-brown set-icon">
                    <i class="fa fa-rocket"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/user" title="">Quản lý người dùng</a></p>
                        <p class="text-muted">Có <%=countUser %> người dùng</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-yellow set-icon">
                    <i class="fa fa-phone"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/contact" title="">Quản lý liên hệ	</a></p>
                        <p class="text-muted">Có <%=countContact %> Người liên hệ</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-shopping-cart"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/contact" title="">Quản lý giỏ hàng</a></p>
                        <p class="text-muted">Có <%=countContact %> Sản phẩm đã mua</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green1 set-icon">
                    <i class="fa fa-comment"></i>
                </span>
                    <div class="text-box">
                        <p class="main-text"><a href="<%=request.getContextPath()%>/admin/comment" title="">Quản lý bình luận</a></p>
                        <p class="text-muted">Có <%=countComment %> Người bình luận</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    document.getElementById("index").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>