<%@page import="models.Jewelry"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <style>
	/* thiết lập style cho thẻ a */
 .pagination a {
   color: #8A0829;
   float: left;
   padding: 8px 16px;
   text-decoration: none;
   transition: background-color .3s;
 }
/* thiết lập style cho class active */
 .pagination a.active {
   background-color: dodgerblue;
   color: white;
 }
/* thêm màu nền khi người dùng hover vào class không active */
 .pagination a:hover:not(.active) {
   background-color: #80FF00;
 }
</style>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row">
<%@include file="/templates/public/assets/inc/sidebar.jsp" %>
<div class="span9">
	  <%
    	if( request.getAttribute("cat")!=null){
           		Category cat=(Category)request.getAttribute("cat");
    %>
		<h1 style="color: yellow;"><%=cat.getName()%></h1>
		
	<%
				}
			%>
<div class="well well-small">
	<hr class="soften">
	<%
    	ArrayList<Jewelry> listCatJewelryPage=null;
            	if(request.getAttribute("listCatJewelryPage")!=null&&request.getAttribute("cat_id")!=null){
            		int cat_id=(int)request.getAttribute("cat_id");
            		listCatJewelryPage=(ArrayList<Jewelry>)request.getAttribute("listCatJewelryPage");
            		if(listCatJewelryPage!=null&listCatJewelryPage.size()>0){
            			for(Jewelry catJewelry:listCatJewelryPage){
            				//String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(catJewelry.getName())+"-"+catJewelry.getId() + "-" + catJewelry.getId_category().getId() + ".html";
   %>
	<div class="row-fluid">	  
		<div class="span2">
			<%
                                        		if(!"".equals(catJewelry.getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=catJewelry.getPicture() %>" alt="<%=catJewelry.getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
		</div>
		<div class="span6">
			<h5><%=catJewelry.getName()%></h5>
			<p>
			<%=catJewelry.getTitle()%>
			</p>
		</div>
		<div class="span4 alignR">
		<form class="form-horizontal qtyFrm">
		<h3> $<%=catJewelry.getPrice()%></h3>
		<label class="checkbox">
			<input type="checkbox">  Adds product to compair
		</label><br>
		<div class="btn-group">
		  <span class=" icon-shopping-cart"></span><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=catJewelry.getId()%>)"> Add to cart</a>
		  <a href="<%=request.getContextPath() %>/product_details?id=<%=catJewelry.getId() %>" class="shopBtn">VIEW</a>
		 </div>
			</form>
		</div>
	</div>
	 <%
                      		}
                      }
                }

              %> 
</div>
 <div class="pagination">
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(listCatJewelryPage != null && listCatJewelryPage.size() > 0 && numberOfPages > 1){
                           			if( request.getAttribute("cat")!=null){
            	        	       		Category cat=(Category)request.getAttribute("cat");
                           			
    							 	if (currentPage > 1) {
     								int back = currentPage - 1;
    							 %>
                                          <a  href="<%=request.getContextPath()%>/list_view?id=<%=cat.getId()%>&page=<%=back%>">Previous</a>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <a class="active" href="<%=request.getContextPath()%>/list_view?id=<%=cat.getId()%>&page=<%=i%>"><%=i %></a>
									<%
                                    		}else{
                                    %>
                                           <a  href="<%=request.getContextPath()%>/list_view?id=<%=cat.getId()%>&page=<%=i%>"><%=i %></a>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <a  href="<%=request.getContextPath()%>/list_view?id=<%=cat.getId()%>&page=<%=next%>">Next</a></li>
                                     <%
    										}
   									  %>
                                <%}}%>
     </div>
</div>
</div>
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
				//$("#img"+x).attr("src",data);
				//alert('Đã lưu vào giỏ hàng');
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