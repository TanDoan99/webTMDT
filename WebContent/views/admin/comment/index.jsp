<%@page import="models.Comment"%>
<%@page import="java.util.List"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý bình luận</h2>
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
                            <div class="row" style='margin-right: 10px;'>
                                 <form method="get" action="<%=request.getContextPath()%>/admin/">
                                
                            	<input value="<%if(request.getParameter("snames")!=null) out.print(request.getParameter("snames")); %>" type="search" class="form-control input-sm" placeholder="Nhập tên người bình luận" name="snames" style="float:right; width: 200px;" />
							    <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right:20px;" />
                                </form>
                            </div></br>
							<%
								String msg = (String) request.getParameter("msg");
								if("1".equals(msg)) {
							%>
							<div class="alert alert-success"  role="alert">
 								Xóa thành công!
							</div>
							<%
								}
							%>
							
							<%
								String err = (String) request.getParameter("err");
													if("0".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
 								 xóa thất bại!
							</div>
							<%
								}
							%>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên người bình luận</th>
                                        <th>Bình luận</th>
                                        <th>Ngày bình luận</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody >
                               	<%
                               		List<Comment> listCmt=null;
                               		if(request.getAttribute("cmtList")!=null){
                               			listCmt=(ArrayList<Comment>)request.getAttribute("cmtList");
                               			for(Comment objCmt: listCmt){
                               				if(listCmt.size()>0){
                               	%>
                                    <tr>
                                        <td><%=objCmt.getId()%></td>
                                        <td class="center"><%=objCmt.getName()%></td>
                                        <td class="center"><%=objCmt.getCmt()%></td>
                                        <td class="center"><%=objCmt.getDate_send()%></td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath()%>/admin/comment/del?id=<%=objCmt.getId()%>" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa bình luận không?')"><i class="fa fa-pencil"></i> Xóa</a>
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
                           		if(listCmt!= null && listCmt.size() > 0 && numberOfPages > 1){
                           		
                          	 	
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
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/contact?page=<%=back%>">Trang trước</a></li>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/comment?page=<%=i%>"><%=i %></a></li>
									<%
                                    		}else{
                                    %>
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/comment?page=<%=i%>"><%=i %></a></li>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/comment?page=<%=next%>">Trang tiếp</a></li>
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
    document.getElementById("category").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>