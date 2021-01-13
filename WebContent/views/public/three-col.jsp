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
	<h3 style="color: yellow;">Three Column Product view </h3>
	<%
	JewelryDAO jewelryDAO= new JewelryDAO();
		List<Jewelry> listJewelry=null;
		if(request.getAttribute("jewelryList")!=null){
			listJewelry = (List<Jewelry>)request.getAttribute("jewelryList");
			int k=listJewelry.size()%3;
			//out.print(listJewelry.size());
			if(listJewelry.size()>0){
				for(int i=0;i<listJewelry.size()/3;i++){
					int j = i*3;
	%>
		<ul class="thumbnails">
			<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=listJewelry.get(j).getId()%>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
					<% 
					if(!"".equals(listJewelry.get(j).getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=listJewelry.get(j).getPicture() %>" alt=""/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>

				</a>
				<div class="caption cntr">
					<p><%=listJewelry.get(j).getName() %></p>
					<p><strong> $<%=listJewelry.get(j).getPrice()%></strong></p>
					<%if(user!=null){ %>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=listJewelry.get(j).getId()%>)"> Add to cart </a></h4>
					<%} %>
					<div class="actionList">
						<a class="pull-left" href="#">Add to Wish List </a> 
						<a class="pull-left" href="#"> Add to Compare </a>
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=listJewelry.get(j+1).getId()%>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
					<% 
					if(!"".equals(listJewelry.get(j+1).getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=listJewelry.get(j+1).getPicture() %>" alt=""/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>

				</a>
				<div class="caption cntr">
					<p><%=listJewelry.get(j+1).getName() %></p>
					<p><strong> $<%=listJewelry.get(j+1).getPrice()%></strong></p>
					<%if(user!=null){ %>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=listJewelry.get(j+1).getId()%>)"> Add to cart </a></h4>
					<%} %>
					<div class="actionList">
						<a class="pull-left" href="#">Add to Wish List </a> 
						<a class="pull-left" href="#"> Add to Compare </a>
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=listJewelry.get(j+2).getId()%>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
				<% 
					if(!"".equals(listJewelry.get(j+2).getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=listJewelry.get(j+2).getPicture() %>" alt=""/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
				</a>
				<div class="caption cntr">
					<p><%=listJewelry.get(j+2).getName() %></p>
					<p><strong> $<%=listJewelry.get(j+2).getPrice()%></strong></p>
					<%if(user!=null){ %>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=listJewelry.get(j+2).getId()%>)"> Add to cart </a></h4>
					<%} %>
					<div class="actionList">
						<a class="pull-left" href="#">Add to Wish List </a> 
						<a class="pull-left" href="#"> Add to Compare </a>
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
		</ul>
	
		
<%
	}
%>
	<%
	if(k>0){
	%>
		<ul class="thumbnails">
		<%
			for(int m=k;m>=1;m--){
		%>
			<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=listJewelry.get(listJewelry.size()-m).getId()%>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
				<% 
					if(!"".equals(listJewelry.get(listJewelry.size()-m).getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=listJewelry.get(listJewelry.size()-m).getPicture() %>" alt=""/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
				</a>
				<div class="caption cntr">
					<p><%=listJewelry.get(listJewelry.size()-m).getName() %></p>
					<p><strong> $<%=listJewelry.get(listJewelry.size()-m).getPrice() %></strong></p>
					<%if(user!=null){ %>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=listJewelry.get(listJewelry.size()-m).getId()%>)"> Add to cart </a></h4>
					<%} %>
					<div class="actionList">
						<a class="pull-left" href="#">Add to Wish List </a> 
						<a class="pull-left" href="#"> Add to Compare </a>
					</div> 
					<br class="clr">
				</div>
			  </div>
			</li>
		<%
			} 
		%>
		</ul>			
<%
			}
		}
	}
%>
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