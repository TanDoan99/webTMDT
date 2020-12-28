<%@page import="models.Jewelry"%>
<%@page import="java.util.List"%>
<%@page import="models.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa sản phẩm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <%
                            	String err = (String) request.getParameter("err");
                                                        						if("1".equals(err)) {
                            %>
							<div class="alert alert-danger" role="alert">
 								 Vui lòng nhập tên da!
							</div>
							<%
								}
							%>
                            <%
                            	if("2".equals(err)) {
                            %>
							<div class="alert alert-danger" role="alert">
 								 Sửa thất bại!
							</div>
							<%
								}
							%>
							<%
								if("3".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
 								 Không tìm thấy id để sửa!
							</div>
							<%
								}
							%>
                                <form action="<%=request.getContextPath()%>/admin/jewelry/edit" role="form" method="post"  id="form" enctype="multipart/form-data">
                                	<%
                                		if(request.getAttribute("jewelry")!=null){
                                	                                			Jewelry jewelry=(Jewelry) request.getAttribute("jewelry");
                                	                                			if(jewelry!=null){
                                	%>
                                	
                                   <div class="form-group">
                                   
                                        <input type="text" id="name" value="<%=jewelry.getId()%>" name="id" class="form-control" />
                                    </div>
                                  <div class="form-group">
                                        <label for="category">Loại sản phẩm</label>
                                        <select id="category" name="category" class="form-control">
                                        <%
                                        	if(request.getAttribute("listCat")!=null){
                                        		List<Category> listCat=(List<Category>)request.getAttribute("listCat");
                                        		if(listCat.size()>0){
                                        			for(Category cat:listCat){
                                        				%>
	                                       				 <option value="<%=cat.getId()%>"><%=cat.getName() %></option>
	                                       				 <%
                                        			}
                                        		}
                                        	}
                                        %>
											
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="sizes">Kích Thước</label>
                                        <input type="text" name="sizes" value="<%=jewelry.getSizes() %>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tên sản Phẩm</label>
                                         <input type="text" name="name"value="<%=jewelry.getName() %>" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                      <img width="200px" height="200px"	 alt="<%=request.getContextPath() %>/uploads/images/main_bg.gif" src="<%=request.getContextPath() %>/uploads/images/<%=jewelry.getPicture()%>"><br/>
                                        <label for="picture">Hình ảnh sản phẩm</label>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Giá bán</label>
                                         <input type="text" name="price"value="<%=jewelry.getPrice() %>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="sale">Giảm giá</label>
                                         <input type="text" name="sale"value="<%=jewelry.getSale() %>" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Tiêu đề</label>
                                        <textarea id="title" class="form-control" rows="3" name="title"><%=jewelry.getTitle() %></textarea>
                                    </div>
                                     <div class="form-group">
                                        <label for="highlight">Điểm nổi bật</label>
                                         <input type="text" name="highlight"value="<%=jewelry.getHighlight() %>" class="form-control" />
                                    </div>
                                   <div class="form-group">
                                        <label for="new_product">Sản phẩm mới</label>
                                         <input type="text" name="new_product" value="<%=jewelry.getNew_product() %>" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" rows="" name="detail"><%=jewelry.getDetail() %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                      <%
                                      
                                			}
                                		}
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("cat").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>