<%@page import="models.Jewelry"%>
<%@page import="daos.JewelryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
<!--
Three column view
-->
	<h3 style="color: yellow;">Four Column Product view </h3>
		<ul class="thumbnails">
		<%
		JewelryDAO jewelryDAO= new JewelryDAO();
		List<Jewelry> listJewelry=null;
		if(request.getAttribute("jewelryList")!=null){
			listJewelry = (List<Jewelry>)request.getAttribute("jewelryList");
			int k=listJewelry.size()%3;
			if(listJewelry.size()>0){
				for(Jewelry objJewe: listJewelry){
		%>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=objJewe.getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
				<% 
					if(!"".equals(objJewe.getPicture() )){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=objJewe.getPicture() %>" alt=""/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
				</a>
				<div class="caption cntr">
					<p><%=objJewe.getName() %></p>
					<p><strong> $<%=objJewe.getPrice() %></strong></p>
					<%if(user!=null){ %>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=objJewe.getId()%>)"> Add to cart </a></h4>
					<%} %>
					<div class="actionList">
						<a class="pull-left" href="#">Add to Wish List </a> 
						<a class="pull-left" href="#"> Add to Compare </a>
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
			<%}}}%>
  </ul>
<script>
	function addToCart(id){
		//alert("đã goi hàm");
		$.ajax({
			url: '<%=request.getContextPath()%>/index.html',
			type: 'POST',
			cache: false,
			data: {
				aid : id
			},
			success: function(data){
				alert('Đã thêm vào giỏ hàng');
				//alert(data);
				$('#sizeCart').html(data);
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
</script>
<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>