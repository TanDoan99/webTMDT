<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Check Out</li>
    </ul>
	<div class="well well-small">
		<h1>Check Out <small class="pull-right"> <span id="sizeCart"><%if(listCart!=null) out.print(listCart.size());else out.print(0); %> </span> Items are in the cart </small></h1>
	<hr class="soften"/>	
	<table class="table table-bordered table-condensed">
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
					if(session.getAttribute("listCart")!=null){
						List<Cart> listCartPro=(List<Cart>)session.getAttribute("listCart");
						for(Cart objCart:listCartPro){
					
				%>
              <tbody>
              	
                <tr>
                  <!-- <td><img width="100" src="assets/img/e.jpg" alt=""></td> -->
                  
                  <td><%=objCart.getProduct().getName() %>  </td>
                  <td><img style="width: 200px;height: 200px;" alt="<%=request.getContextPath() %>/templates/public/assets/img/<%=objCart.getProduct().getPicture() %>" src="<%=request.getContextPath() %>/templates/public/assets/img/<%=objCart.getProduct().getPicture() %>"></td>
                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
                  <td>$<%=objCart.getProduct().getPrice() %></td>
                  <td>
					<input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" type="text" value="<%=objCart.getNumber()%>">
				  <div class="input-append">
					<button onclick="numberCart(<%=objCart.getProduct().getId() %>,0)" class="btn btn-mini" type="button">-</button><button onclick="numberCart(<%=objCart.getProduct().getId() %>,1)" class="btn btn-mini" type="button"> + </button><button class="btn btn-mini btn-danger"  type="button"><span class="icon-remove"></span></button>
				</div>
				</td>
                  <td>$10000</td>
                </tr>
				
		
		<%}} %> 
				<tr>
                  <td colspan="6" class="alignR">Total products:	</td>
                  <td> $448.42</td>
                </tr>
				<tr>
                  <td colspan="6" class="alignR">Total products:	</td>
                  <td class="label label-primary"> $448.42</td>
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
			<table class="table table-bordered">
			<tbody>
                <tr><td>ESTIMATE YOUR SHIPPING & TAXES</td></tr>
                 <tr> 
				 <td>
					<form class="form-horizontal">
					  <div class="control-group">
						<label class="span2 control-label" for="inputEmail">Country</label>
						<div class="controls">
						  <input type="text" placeholder="Country">
						</div>
					  </div>
					  <div class="control-group">
						<label class="span2 control-label" for="inputPassword">Post Code/ Zipcode</label>
						<div class="controls">
						  <input type="password" placeholder="Password">
						</div>
					  </div>
					  <div class="control-group">
						<div class="controls">
						  <button type="submit" class="shopBtn">Click to check the price</button>
						</div>
					  </div>
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
	function numberCart(idPro,number){
		//alert("hàm đã tạo");
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
				$('#appendedInputButtons').val(data);
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