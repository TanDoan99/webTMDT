<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row" id="body">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Check Out</li>
    </ul>
	<div class="well well-small">
		<h1>Check Out <small class="pull-right"> <span id="sizeCart"><%if(listCart!=null) out.print(listCart.size());else out.print(0); %> </span> Items are in the cart </small></h1>
	<hr class="soften"/>	
	<table class="table table-bordered table-condensed" id="table">
              <thead>
                <tr>
                  <th>Product</th>
                  <!-- <th>Description</th> -->
                  <th>Picture</th>
                  <th>Avail.</th>
                  <th>Unit price</th>
                  <th>Qty </th>
                  <th>Total</th>
				</tr>
              </thead>
				<%
					double tong=0;
					if(session.getAttribute("listCart")!=null){
						List<Cart> listCartPro=(List<Cart>)session.getAttribute("listCart");
						for(Cart objCart:listCartPro){
						
				%>
              <tbody>
              	
                <tr>
                  <!-- <td><img width="100" src="assets/img/e.jpg" alt=""></td> -->
                  
                  <td><%=objCart.getProduct().getName() %>  </td>
                  <td>
                  <%-- <img style="width: 200px;height: 200px;" alt="<%=request.getContextPath() %>/templates/public/assets/img/<%=objCart.getProduct().getPicture() %>" src="<%=request.getContextPath() %>/templates/public/assets/img/<%=objCart.getProduct().getPicture() %>"> --%>
                  <%
                                        		if(!"".equals(objCart.getProduct().getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=objCart.getProduct().getPicture() %>" alt="<%=objCart.getProduct().getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
                  </td>
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  <td >$<%=objCart.getProduct().getPrice() %></td>
                  <td>
					<input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons<%=objCart.getProduct().getId() %>" size="16" type="text" value="<%=objCart.getNumber()%>">
				  <div class="input-append">
					<button onclick="numberCart(<%=objCart.getProduct().getId() %>,0,<%=objCart.getProduct().getPrice() %>)" class="btn btn-mini" type="button">-</button><button onclick="numberCart(<%=objCart.getProduct().getId() %>,1,<%=objCart.getProduct().getPrice() %>)" class="btn btn-mini" type="button"> + </button><button class="btn btn-mini btn-danger" id="delete"  type="button" onclick="deleteCart(<%=objCart.getId()%>)"><span class="icon-remove"></span></button>
				</div>
				</td>
                  <td id="giasp<%=objCart.getProduct().getId()%>">$<%=objCart.getProduct().getPrice()*objCart.getNumber() %></td>
                </tr>
		<%
		  double priceTong=objCart.getProduct().getPrice()*objCart.getNumber();
		  tong+=priceTong;
		}}
		 %> 
				<tr>
                  <td colspan="6" class="alignR">Total products:	</td>
                  <td class="label label-primary" id="sum" > $<%=tong %></td>
                </tr>
			</tbody>
            </table><br/>
            <table class="table table-bordered">
			<tbody>
				 <tr>
                  <td> 
				<form class="form-inline">
				  <label style="min-width:159px"> VOUCHERS Code: </label> 
				<input type="text" class="input-medium" placeholder="CODE">
				<button type="submit" class="shopBtn"> ADD</button>
				</form>
				</td>
                </tr>
				
			</tbody>
				</table>
					
	<a href="<%=request.getContextPath() %>/product" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </a>
	<a href="login.html" class="shopBtn btn-large pull-right">Next <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>
<script type="text/javascript">
	function numberCart(idPro,number,price){
		//alert("hàm đã tạo");
		//alert(price)
		$.ajax({
			url: '<%=request.getContextPath()%>/cart',
			type: 'POST',
			cache: false,
			data: {
				aid : idPro,
				anumber : number
			},
			success: function(data){
				//$("#img"+x).attr("src",data);
				//alert('Đã lưu vào giỏ hàng');
				//alert(data);
				let listNumber =JSON.parse(data);
				if(listNumber.length>0){
				$('#appendedInputButtons'+idPro).val(listNumber[0]);
				$('#giasp'+idPro).text('$'+listNumber[0]*price);
				$('#sum').text('$'+listNumber[1]);
				//alert(data*price);
				}
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
		}
	function deleteCart(id){
		let check = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
		if(check){
			$.ajax({
				url: '<%=request.getContextPath()%>/cart',
				type: 'GET',
				data: {aid: id},
				success: function(data){
					//alert(data);
					$('#table').load(' #table');
					$('#del').load(' #del');
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
		}
	}
	
</script>
<style>
	.le-button {
  float: right;
  border-radius: 0 5px 5px 0;
}
.le-button {
	background-color:green;
  border-radius: 4px;
  font-weight: bold;
  padding: 10px 20px;
  display: inline-block;
  line-height: 20px;
  border: none;
  font-size: 15px;
  color: black;
  text-transform: capitalize;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}
</style>
<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>