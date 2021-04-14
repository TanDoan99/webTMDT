<%@page import="daos.JewelryDAO"%>
<%@page import="models.Category"%>
<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
<%@page import="models.Jewelry"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>

<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý sản phẩm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath()%>/admin/jewelry/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="get" action="<%=request.getContextPath()%>/admin/jewelry">
                                        <input value="<%if(request.getParameter("sname")!=null) out.print(request.getParameter("sname"));%>" type="search" class="form-control input-sm" placeholder="Nhập tên sản phẩm" name="sname" style="float:right; width: 200px;" />
                                        <select  name="scat"  class="btn-sm" style="float:right; margin-right:20px;" >
                                        	<option value="0">-- Chọn danh mục --</option>
                                        	<%
                                        		int scat = 0;
                             	if(request.getAttribute("scat")!=null){
                              		scat =(Integer) request.getAttribute("scat");
                             	}
                 				if(request.getAttribute("catList")!=null){
                          	           	List<Category> listCat=(List<Category>)request.getAttribute("catList");
                                        if(listCat.size()>0){
                                             for(Category cat:listCat){
                                        	%>
	                                       	<option <%if(scat==cat.getId()) out.print("selected");%> 
	                                       	value="<%=cat.getId()%>"><%=cat.getName()%></option>
	                                   		<%
	                                   			}
	                                   			                                   		                                        		}
	                                   			                                   		                                        	}
	                                   		%>
                                        </select>
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right:20px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
							<%
								String msg = (String) request.getParameter("msg");
																						if("OK".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Thêm thành công!
							</div>
							<%
								}
							%>
							<%
								if("ok".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Sửa thành công!
							</div>
							<%
								}
							%>
							<%
								if("1".equals(msg)) {
							%>
							<div class="alert alert-warning"  role="alert">
 								Xóa thành công!
							</div>
							<%
								}
							%>
                            <table  class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                         <th>ID</th>
                                        <th>Loại sản phẩm</th>
                                        <th>Kích Thước</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Hình ảnh</th>
                                        <th>Giá bán</th>
                                        <th>Giảm giá</th>
                                        <!-- <th>Tiêu đề</th>
                                        <th>Điểm nổi bật</th>
                                        <th>Sản phẩm mới</th>
                                        <th>Chi tiết</th> -->
                                        <th>Ngày tạo</th>
                                       <!--  <th>Ngày cập nhập</th> -->
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                      	<%
                      		JewelryDAO jewelryDAO= new JewelryDAO();
                      		List<Jewelry> listJewelry=null;
                      		if(request.getAttribute("jewelryList")!=null){
                      			listJewelry = (List<Jewelry>)request.getAttribute("jewelryList");
                      			if(listJewelry.size()>0){
                      				for(Jewelry objJewelry: listJewelry){
                      					 String urlDel=request.getContextPath()+"/admin/jewelry/del?sid="+objJewelry.getId();
                      					String urlEdit=request.getContextPath() +"/admin/jewelry/edit?id="+objJewelry.getId();
                      					
                       	%>
                                    <tr>
                                        <td><%=objJewelry.getId()%></td>
                                        <td class="center"><%=objJewelry.getId_category().getName() %></td>
                                        <td class="center"><%=objJewelry.getSizes() %></td>
                                        <td class="center"><%=objJewelry.getName() %></td>
                                        <td class="center">
                                        
                                        	<%
                                        		if(!"".equals(objJewelry.getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=objJewelry.getPicture() %>" alt="<%=objJewelry.getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="no img"/>
                                      		<%} %>
                                        </td>
                                        <td class="center"><%=objJewelry.getPrice() %></td>
                                        <td class="center"><%=objJewelry.getSale() %>(%)</td>
                                        <%-- <td class="center"><%=objJewelry.getTitle() %></td>
                                        <td class="center"><%=objJewelry.getHighlight() %></td>
                                        <td class="center"><%=objJewelry.getNew_product() %></td> 
                                        <td class="center"><%=objJewelry.getDetail() %></td>--%>
                                        <td class="center"><%=objJewelry.getCreated_at() %></td>
                                        <%-- <td class="center"><%=objJewelry.getUpdated_at() %></td> --%>
                                        <td class="center">
                                            <a href="<%=urlEdit %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=urlDel %>" onclick="return confirm('Bạn có chắc chắn muốn xóa bài hát không?')" title="" class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a>
                                        </td>
                                    </tr>
                                  <%
                      						}
                      					}
                      				}

                                  %>  
									
                                </tbody>
                            </table>
                             <div class="row">
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(listJewelry != null && listJewelry.size() > 0 && numberOfPages > 1){
                           		
                          	 	
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
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/jewelry?page=<%=back%>">Trang trước</a></li>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/jewelry?page=<%=i%>"><%=i %></a></li>
									<%
                                    		}else{
                                    %>
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/jewelry?page=<%=i%>"><%=i %></a></li>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/jewelry?page=<%=next%>">Trang tiếp</a></li>
                                     <%
    										}
   									  %>
                                        </ul>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("jewelry").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>