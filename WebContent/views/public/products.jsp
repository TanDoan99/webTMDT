<%@page import="models.Jewelry"%>
<%@page import="daos.JewelryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row">
<%@include file="/templates/public/assets/inc/sidebar.jsp" %>
<style>
.pagination{
	float: left;
	margin-left: 30px;
}
	/* thiết lập style cho thẻ a */
 .pagination a {
   color: #00bf00;
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
.img img {
    width: 100%;
    height: auto;
    transition: all ease-in-out ;
}
 
.txt {
    text-align: center;
    opacity: 0.8;
}
 .khungsanpham:hover {
    transform: scale(1.05);
    transition: all ease-in-out 0.3s;
    border: 0.5px solid #40FF00;
  
}
.txt:hover {
    opacity: 1.5;
    transform: translateY(-25px);
    transition:ease-in-out 0.8s;
}
 
 .khungsanpham{
		margin-bottom: 50px;
		margin-left:30px;
		float: left;
		border: 0.5px solid #FF00BF;
		border-radius: 0px 10px 0px 10px;
		top: 0px;
	}
.img{
		width: 190px;
		height: 180px;
		text-align: center;

	}
.img img{
		border-top-right-radius: 10px 10px;
	}
.gia{
	text-align: center;
}
.succ{
	margin-bottom: 5px;
}

</style>
	<div class="span9">
<!-- 
New Products
-->
	<div class="well well-small">
	<h3>Our Products </h3>
		<div class="row-fluid">
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
                      					String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(objJewelry.getName())+"-"+objJewelry.getId() + "-" + objJewelry.getId_category().getId() + ".html";
     %>
	<div class="khungsanpham"  >
		<div class="boder">
				<div class="img">
					<a  href="<%=request.getContextPath() %>/product_details?id=<%=objJewelry.getId() %>">
						<%
                                        		if(!"".equals(objJewelry.getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=objJewelry.getPicture() %>" alt="<%=objJewelry.getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
					</a>
				</div>
				 <div class="txt">
                <h3><%=objJewelry.getName() %></h3>
            	</div>
				<div class="gia">
					<%=objJewelry.getPrice()%>
				</div>
				<div class="mua">
				<center><a  href="javascript:void(0)" title="add to cart" onclick="addToCart(<%=objJewelry.getId()%>)"> <button class="btn btn-success succ">Mua ngay</button> </a></center>
				</div>
		</div>
	</div>
		  
	 <%
                      		}
                      }
                }

              %> 
   	 </div>
              <div class="pagination" >
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(listJewelry != null && listJewelry.size() > 0 && numberOfPages > 1){
                           		
    							 	if (currentPage > 1) {
     								int back = currentPage - 1;
    							 %>
                                          <a  href="<%=request.getContextPath()%>/product?page=<%=back%>">Previous</a>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <a class="active" href="<%=request.getContextPath()%>/product?page=<%=i%>"><%=i %></a>
									<%
                                    		}else{
                                    %>
                                           <a  href="<%=request.getContextPath()%>/product?page=<%=i%>"><%=i %></a>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <a  href="<%=request.getContextPath()%>/product?page=<%=next%>">Next</a></li>
                                     <%
    										}
   									  %>
                                <%}%>
   				  </div>
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