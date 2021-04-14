<%@page import="daos.OrderDetailDAO"%>
<%@page import="models.Cart"%>
<%@page import="models.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.JewelryDAO"%>
<%@page import="models.Category"%>
<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>

<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý đơn hàng</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="card">
              <div class="card-header">
          
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                  	<th>Id</th>
                    <th>Tổng tiền</th>
                    <th>Phương thức thanh toán</th> 
                    <th>Giảm giá</th> 
                    <th>Ngày tạo</th> 
                   <!--  <th>ID Người tạo</th> -->
                    <th>Chi tiet</th>            
                  </tr>
                  </thead>
                  <tbody>
          <%	
         
      			ArrayList<Order> orderList = new ArrayList<Order>();
				if(request.getAttribute("orderList")!=null){
					orderList = (ArrayList<Order>)request.getAttribute("orderList");
					
				if(orderList.size()>0){
					for(Order pro: orderList){
							
		  %>                      
                     <tr class="tr" id="<%=pro.getId()%>">
                     <td><%=pro.getId()%></td>
                     <td><%=pro.getTotalMoney()%></td>
                      <td><%=pro.getPaymentMethod() %></td>
                      <td><%=pro.getDiscount()*100%>%</td>
                     <td><%=pro.getCreateDate()%></td>
                    <!--   <td><%=pro.getCreateBy() %></td>-->
                     <td>
                     <button type="button"  class="btn btn-block btn-success" data-toggle="modal" data-target="#modal-default<%=pro.getId()%>">Xem</button>
                     <!-- The Modal -->
				      <div class="modal fade" id="modal-default<%=pro.getId()%>">
				        <div class="modal-dialog">
				          <div class="modal-content">
				            <div class="modal-header">
				              <h4 class="modal-title">Chi tiết đơn hàng</h4>
				              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                <span aria-hidden="true">&times;</span>
				              </button>
				            </div>
				            <div class="modal-body">
								<table id="example1" class="table table-bordered table-striped">
					                  <thead>
					                  <tr>
					                  	 <th>Tên sản phẩm</th>        
								         <th>Số lượng</th>
								         <th>Đơn Giá</th>           
					                  </tr>
					                  </thead>
					                  <tbody>
					                  	 <%	OrderDetailDAO odDAO = new OrderDetailDAO();
								                  		JewelryDAO productDAO = new JewelryDAO();
								         				List<Cart> odList1 =  odDAO.findByOrderId(pro.getId());
								                        if(odList1.size() > 0){
								                        	for(Cart orderDetail : odList1){
								                        		
								                  %>
								                  			
								                    			 <tr>
								                    			 <td><%= productDAO.getItem(orderDetail.getProduct().getId()).getName()%></td>
								                    			 <td><%= orderDetail.getNumber()%></td>
								                    			 <% if(productDAO.getItem(orderDetail.getProduct().getId()).getSale()>0){%>
								                    			 <td><%=productDAO.getItem(orderDetail.getProduct().getId()).getSale()%></td>
								                    			 <%}else{ %>
								                    			 <td><%=productDAO.getItem(orderDetail.getProduct().getId()).getPrice()%></td>
								                    			 <%} %>
								                    			 </tr>
								                        			
								                   <% 
								    
								                        	}
								                        }
								                  		
								                   %>
					                  </tbody>
								  </table>
				            </div>
				          </div>
				          <!-- /.modal-content -->
				        </div>
				        <!-- /.modal-dialog -->
				      </div>
				      <!-- /.modal -->
                     </td>
                     </tr>  
          	<%}}}%> 
                  </tbody>
                
                </table>
              </div>
              <!-- /.card-body -->
              <div class="row">
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(orderList != null && orderList.size() > 0 && numberOfPages > 1){
                           		
                          	 	
                            %>
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Trang <%=currentPage%>  của <%=numberOfPages %> </div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                               
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                <%
    							 	if (currentPage > 1) {
     								int back = currentPage - 1;
    							 %>
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/order/index?page=<%=back%>">Trang trước</a></li>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/order/index?page=<%=i%>"><%=i %></a></li>
									<%
                                    		}else{
                                    %>
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/order/index?page=<%=i%>"><%=i %></a></li>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/order/index=<%=next%>">Trang tiếp</a></li>
                                     <%
    										}
   									  %>
                                        </ul>
                                    </div>
                                </div>
                                <%}%>
                            </div>
           	  <div style="display: none;" id="result" ></div> 
            </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>

<script>
    

	
    $(document).ready(function() {  
  	if($('#numberOfPages').val() == 1){
  			 $('#li1').hide();
  			 $('#li2').hide();
  			 $('#li4').hide();
  			 $('#li5').hide();
  			
  		 }else if($('#currentPage').val() == 1){
  			 $('#li1').hide();
  			 $('#li2').hide();
  			
  		 }else if($('#currentPage').val() == $('#numberOfPages').val()){
  			 $('#li4').hide();
  			 $('#li5').hide();
  			
  		 }
  		 
  	 document.getElementById("order").classList.add('active-menu');
  	 
  	 
  	  $(function() {
  		    var Toast = Swal.mixin({
  		      toast: true,
  		      position: 'top-end',
  		      showConfirmButton: false,
  		      timer: 3000
  		    });
  });
    </script>  


<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>