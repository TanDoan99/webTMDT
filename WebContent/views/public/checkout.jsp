<%@page import="java.util.ArrayList"%>
<%@page import="models.OrderDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>

	

	<!-- ========================================= CONTENT ========================================= -->

<section id="checkout-page">
    <div class="well well-small">
            	<div class="control-group">
        
            <section id="your-order">
                <h2 >your order</h2>
                <form>
                	<%if(session.getAttribute("listCart")!=null){ 
                		ArrayList<Cart> listCart = (ArrayList)session.getAttribute("listCart");
                		if(listCart.size()>0){
                		for(Cart od : listCart){%>
                    <div class="control-group">
                        <div class="col-xs-12 ">
                            <a href="#" class="qty"><%=od.getNumber()%> x</a>
                        </div>

                        <div class="col-xs-12 ">
                            <div class="title"><a href="<%=request.getContextPath()%>/product_details?id=<%=od.getProduct().getId()%>"><%=od.getProduct().getName()%></a></div>
                        </div>

                        <div class="col-xs-12 ">
                        <%if(od.getProduct().getSale()!=0){%>
                        	<div class="price"><%=od.getProduct().getSale()*od.getNumber()%></div>
                        <%}else{ %>	
                        	<div class="price"><%=od.getProduct().getPrice()*od.getNumber()%></div>
 						<%}%>		
                        </div>
                    </div><!-- /.order-item -->
                    <%}}else{out.print("<h1>Bạn chưa có đơn hàng nào</h1>");}}%>
                </form>
              
            </section><!-- /#your-order -->

			<div id="total-area" class="row no-margin">
                <div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-left">
			<div id="cupon-widget" class="widget">
                <h1 style="margin-left: 20px;">use coupon</h1>
                <div class="body">
                        <div class="inline-input">
                            <input style="margin-left: 20px;" id="coupon" placeholder="Nhập mã 123 để đc giảm giá 50% đơn hàng" type="text" />
                            <a class="le-button" id="applyCoupon" href="#">Apply</a>
                        </div>
                    
                      </div>
            </div>	
                </div>
            </div><!-- /.widget -->
            <div id="total-area" class="row no-margin">
                <div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-left">
                    <div id="subtotal-holder">
                        <ul class="tabled-data inverse-bold no-border">
                            <li>
                                <label>cart subtotal</label>
                                <div class="value "><%if(request.getAttribute("totalMoney")!=null)out.print(request.getAttribute("totalMoney"));%></div>
                            </li>
                            <li>
                                <label>Coupon</label>
                                <div class="value"><div id ="valueCoupon"></div></div>
                            </li>
                        </ul><!-- /.tabled-data -->

                        <ul id="total-field" class="tabled-data inverse-bold ">
                            <li>
                                <label>order total</label>
                                <div class="value"><div id ="myDiv2"><%if(request.getAttribute("totalMoney")!=null)out.print(request.getAttribute("totalMoney")); %></div></div>
                            </li>
                        </ul><!-- /.tabled-data -->

                    </div><!-- /#subtotal-holder -->
                </div><!-- /.col -->
            </div><!-- /#total-area -->

			
      <div class="billing-address">
                <h2 class="border h1">billing</h2>
                <%
                if(session.getAttribute("userInfor")!=null){
                	user = (User)session.getAttribute("userInfor");
                	
                }%>
                <form  action="<%=request.getContextPath()%>/checkout" id="orderForm" method="POST">
                	 <div class="control-group">
                        <div class="col-xs-12 col-sm-6">
                            <label>full name*</label>
                            <input class="le-input" value="<%if(user.getFullname()!=null){out.print(user.getFullname());} %>" id="fullname" name="fullname">
                        </div>
                    </div><!-- /.field-row -->

                    <div class="control-group">
                        <div class="col-xs-12 col-sm-6">
                            <label>address*</label>
                            <input type="text" class="le-input" value="<%if(user.getAddress()!=null){out.print(user.getAddress());} %>"  id="address"  name="address" >
                        </div>
                     
                    </div><!-- /.field-row -->

                    <div class="control-group">
                        <div class="col-xs-12 col-sm-6">
                            <label>phone number*</label>
                            <input type="text" class="le-input" value="<%if(user.getTelephone_number()!=null){out.print(user.getTelephone_number());} %>" id="phone" name="phone" placeholder="">
                        </div>
                    </div>
                    <!-- /.field-row -->
                    <div hidden>
                         <input type="text" id="input1" name="totalMoney" value="<%if(request.getAttribute("totalMoney")!=null){out.print(request.getAttribute("totalMoney"));} %>" >
                    </div>
                    <div hidden>
                         <input type="text" id="input2" name="discount" value="0" >
                    </div>
                    <div class="control-group">
                        <div style="margin-left: 20px;" class="col-xs-12 col-sm-2">
                            <label>Payment Method</label>
                            
                             <label class="radio-inline">
      							Thanh toán tại nhà<input type="radio" value="Thanh toán tại nhà" id="paymentMethod" name="paymentMethod" checked >
    						</label>
                        </div>
                    </div><!-- /.field-row -->
                    
                    <%
                    List<Cart> odList = new ArrayList<Cart>();
                    if(session.getAttribute("listCart")!=null){
                    	odList = (ArrayList)session.getAttribute("listCart");}
                    if(odList.size()>0){ %>
                    <div class="place-order-button">
               			 <button type="submit" class="le-button big">place order</button>
           			</div><!-- /.place-order-button --> 
           			<%}else{ %>
           			<div class="place-order-button" >
               			 <a href="<%=request.getContextPath()%>/index.html" class="le-button big">Về mua hàng</a>
           			 </div><!-- /.place-order-button -->
					<%} %>
           		    
                </form>
            </div><!-- /.billing-address -->           
        </div><!-- /.col -->
   </div><!-- /.container -->    
</section><!-- /#checkout-page -->
		<!-- jQuery -->
		<script src="<%=request.getContextPath()%>/templates/public/assets/js/jquery-3.2.1.min.js"></script>
		<!-- jquery-validation -->
		<script src="<%=request.getContextPath()%>/templates/public/assets/js/jquery.validate.min.js"></script>
		
 <script>
  $(document).ready(function() {  
	  //$('#valueTotalMoney').html($('#mydiv1').html());
	 // alert($("#myDiv2").html());
	 $("#cart1").hide();
	 
	 function formatCurrency(n, separate = "."){
		  var s = n.toString();
		  var len = s.length;
		  var ret = "";
		  for(var i = 1; i <= len; i++) {
		    ret = s[(len-i)] + ret;
		    
		    if( i % 3  === 0 && i < len) {
		      ret = separate + ret;
		    }
		  }
		  return ret;
		}
	  
   	 $('#applyCoupon').click(function() {
   		 var coupon = $("#coupon").val();
   		 moneyCurrent = $('#input1').val();
   		 if(moneyCurrent!="0"){
   			if(coupon == '123'){
   	   			$("#valueCoupon").html("50%");
   	   			
   	   			var totalMoneySaleOff = moneyCurrent * 50 / 100;
   	   			$('#myDiv2').html(totalMoneySaleOff, "."+"&nbsp;$");
   	   			$('#input1').val(totalMoneySaleOff);
   	   			$('#input2').val(0.5);
   	   		 }else{
   	   			alert("Mã giảm giá ko hợp lệ");
   	   		 }
   	   		 
   		 }
   		 
   	});
   	
	 $('#orderForm').validate({
		 
		    rules: {
				fullname: {
		        	required: true,
				},
				address: {
			        required: true,
					},
				phone: {
				    required: true,
				    number: true,
					},
				paymentMethod: {
				    required: true,
				    
					},
				
		    },
		    messages: {
		    	fullname: {
			        required: "Please enter a fullname",
			    },
			    address: {
			        required: "Please provide a address",
		        },
		        phone: {
				      required: "Please provide a phone",
				      number: "Please enter a valid number.",
				},
				paymentMethod: {
				    required:  "Please choose a method",
				    
					},
				
		    },
		    
		  });

});
 </script>
<%@include file="/templates/public/assets/inc/footer.jsp" %>
 		
		
 