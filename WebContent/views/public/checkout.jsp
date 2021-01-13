<%@page import="models.OrderDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>

	

	<!-- ========================================= CONTENT ========================================= -->

<section id="checkout-page">
    <div class="container">
        <div class="col-xs-12 no-margin">
            <section id="your-order">
                <h2 class="border h1">your order</h2>
                <form>
                	<%if(session.getAttribute("cartList")!=null){ 
                		List<OrderDetail> cartList = (List<OrderDetail>)session.getAttribute("cartList");
                		if(cartList.size()>0){
                		for(OrderDetail od : cartList){%>
                    <div class="row no-margin order-item">
                        <div class="col-xs-12 col-sm-1 no-margin">
                            <a href="#" class="qty"><%=od.getQuantity()%> x</a>
                        </div>

                        <div class="col-xs-12 col-sm-9 ">
                            <div class="title"><a href="<%=request.getContextPath()%>/public/detail?id=<%=od.getProduct().getId()%>"><%=od.getProduct().getName()%></a></div>
                            <div class="brand"><%=od.getProduct().getName()%></div>
                        </div>

                        <div class="col-xs-12 col-sm-2 no-margin">
                        <%if(od.getProduct().getSale()!=0){%>
                        	<div class="price"><%=od.getProduct().getSale()*od.getQuantity()%></div>
                        <%}else{ %>	
                        	<div class="price"><%=od.getProduct().getPrice()*od.getQuantity()%></div>
 						<%}%>		
                        </div>
                    </div><!-- /.order-item -->
                    <%}}else{out.print("<h1>Bạn chưa có đơn hàng nào</h1>");}}%>
                </form>
            </section><!-- /#your-order -->

			<div id="total-area" class="row no-margin">
                <div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-left">
			<div id="cupon-widget" class="widget">
                <h1 class="border">use coupon</h1>
                <div class="body">
                   
                        <div class="inline-input">
                            <input id="coupon" data-placeholder="Nhập mã 123 để đc giảm giá 50% đơn hàng" type="text" />
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
                
                <form  action="<%=request.getContextPath()%>/public/checkout" id="orderForm" method="POST">
                    <!-- /.field-row -->
                    <div hidden>
                         <input type="text" id="input1" name="totalMoney" value="<%if(request.getAttribute("totalMoney")!=null){out.print(request.getAttribute("totalMoney"));} %>" >
                    </div>
                    <div hidden>
                         <input type="text" id="input2" name="discount" value="0" >
                    </div>
                    <div class="row field-row">
                        <div class="col-xs-12 col-sm-2">
                            <label>Payment Method</label>
                            
                             <label class="radio-inline">
      							Thanh toán tại nhà<input type="radio" value="Thanh toán tại nhà" id="paymentMethod" name="paymentMethod" checked >
    						</label>
                        </div>
                    </div><!-- /.field-row -->
                    
                    <div class="place-order-button">
               			 <button type="submit" class="le-button big">place order</button>
           			</div><!-- /.place-order-button --> 
           			    
                </form>
            </div><!-- /.billing-address -->           
        </div><!-- /.col -->
    </div><!-- /.container -->    
</section><!-- /#checkout-page -->

<%@include file="/templates/public/assets/inc/footer.jsp" %>
 		
		
 