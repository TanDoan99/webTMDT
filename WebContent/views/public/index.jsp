<%@page import="models.Jewelry"%>
<%@page import="daos.JewelryDAO"%>
<%@page import="models.Slides"%>
<%@page import="daos.SlidesDAO"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<style>
	/* thiết lập style cho thẻ a */
 .pagination a {
   color: black;
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
   background-color: #ddd;
 }
</style>
<!-- 
Body Section 
-->

<div class="row">
<%@include file="/templates/public/assets/inc/sidebar.jsp" %>
	<div class="span9">
	<div class="well np">
		<div id="myCarousel" class="carousel slide homCar">
            <div class="carousel-inner">
            <%
            	if(request.getAttribute("list")!=null){
            	List<Slides> list=(List<Slides>) request.getAttribute("list");
            	for(Slides objSlide: list){
            %>
			  <div class="item">
                <img  src="<%=request.getContextPath()%>/templates/public/assets/img/<%=objSlide.getImg() %>" alt="bootstrap ecommerce templates">
                <div class="carousel-caption">
                      <h4><%=objSlide.getCaption() %></h4>
                      <p><span><%=objSlide.getContent()%></span></p>
                </div>
              </div>
			  <%}} %>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
          </div>
        </div>
<!--
New Products
-->
	<div class="well well-small">
	<h3>New Products </h3>
	<hr class="soften"/>
		<div class="row-fluid">
		<div id="newProductCar" class="carousel slide">
            <div class="carousel-inner">
			<div class="item active">
			  <ul class="thumbnails">
				<li class="span3">
				<div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a href="#" class="tag"></a>
					<a href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/bootstrap-ring.png" alt="bootstrap-ring"></a>
				</div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a href="#" class="tag"></a>
					<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/i.jpg" alt=""></a>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a href="#" class="tag"></a>
					<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/g.jpg" alt=""></a>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/s.png" alt=""></a>
				  </div>
				</li>
				
			  </ul>
			  </div>
		   <div class="item">
		  <ul class="thumbnails">
			<li class="span3">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/i.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/f.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/h.jpg" alt=""></a>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/j.jpg" alt=""></a>
			  </div>
			</li>
		  </ul>
		  </div>
		   </div>
		  <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
		  </div>
		</div>
	
	<div class="row-fluid">
		  <ul class="thumbnails">
		  <%
                      		JewelryDAO jewelryDAO= new JewelryDAO();
                      		List<Jewelry> listJewelry=null;
                      		if(request.getAttribute("jewelryList")!=null){
                      			listJewelry = (List<Jewelry>)request.getAttribute("jewelryList");
                      			//out.print(listJewelry.size());
                      			int cat_id = 0;
                          		//int i = 0;
                      			if(listJewelry.size()>0){
                      				for(Jewelry objJewelry: listJewelry){
                      					//i++;
                      					cat_id=jewelryDAO.findCatIdIndex(objJewelry.getId());
                      					//String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(objJewelry.getName())+"-"+objJewelry.getId() + "-" + objJewelry.getId_category().getId() + ".html";
                       	%>
			<li class="span4">
			  <div class="thumbnail">
				<a class="zoomTool" href="<%=request.getContextPath() %>/product_details?id=<%=objJewelry.getId()%>&&cat_id=<%=objJewelry.getId_category().getId() %>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="product_details.html">
				<%
                                        		if(!"".equals(objJewelry.getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=objJewelry.getPicture() %>" alt="<%=objJewelry.getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
				</a>
				<div class="caption cntr">
					<p><%=objJewelry.getName() %></p>
					<p><strong> $<%=objJewelry.getPrice() %></strong></p>
					<h4><a class="shopBtn" href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=objJewelry.getId()%>)"> Add to cart </a></h4>
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
                      }
                }

              %>  
                </ul> 
        <div class="pagination">
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(listJewelry != null && listJewelry.size() > 0 && numberOfPages > 1){
                           		
    							 	if (currentPage > 1) {
     								int back = currentPage - 1;
    							 %>
                                          <a  href="<%=request.getContextPath()%>/index.html?page=<%=back%>">Previous</a>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <a class="active" href="<%=request.getContextPath()%>/index.html?page=<%=i%>"><%=i %></a>
									<%
                                    		}else{
                                    %>
                                           <a  href="<%=request.getContextPath()%>/index.html?page=<%=i%>"><%=i %></a>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <a  href="<%=request.getContextPath()%>/index.html?page=<%=next%>">Next</a></li>
                                     <%
    										}
   									  %>
                                <%}%>
     </div>
	</div>	
	</div>
	<!--
	Featured Products
	-->
		<div class="well well-small">
		  <h3><a class="btn btn-mini pull-right" href="products.html" title="View more">VIew More<span class="icon-plus"></span></a> Featured Products  </h3>
		  <hr class="soften"/>
		  <div class="row-fluid">
		  <ul class="thumbnails">
			<li class="span4">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/d.jpg" alt=""></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
					  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
					  <span class="pull-right">$22.00</span>
				  </h4>
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/e.jpg" alt=""></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
					  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
					  <span class="pull-right">$22.00</span>
				  </h4>
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a  href="product_details.html"><img src="<%=request.getContextPath()%>/templates/public/assets/img/f.jpg" alt=""/></a>
				<div class="caption">
				  <h5>Manicure & Pedicure</h5>
				  <h4>
					  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
					  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
					  <span class="pull-right">$22.00</span>
				  </h4>
				</div>
			  </div>
			</li>
		  </ul>	
	</div>
	</div>
	
	<div class="well well-small">
	<a class="btn btn-mini pull-right" href="#">View more <span class="icon-plus"></span></a>
	Popular Products 
	</div>
	<hr>
	<div class="well well-small">
	<a class="btn btn-mini pull-right" href="#">View more <span class="icon-plus"></span></a>
	Best selling Products 
	</div>
	</div>
	</div>
<!--
Footer
-->
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
				alert(data);
				$('#sizeCart').html(data);
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
</script>
<%@include file="/templates/public/assets/inc/footer.jsp" %>