<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm sản phẩm</h2>
            </div>
        </div>
        <%
								String err = (String) request.getParameter("err");
                            	if("0".equals(err)) {
         %>
							<div class="alert alert-danger" role="alert">
 								 Thêm thất bại!
							</div>
							<%
								}
							%>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin/jewelry/add" id="form">
                                    <div class="form-group">
                                        <label for="category">Loại sản phẩm</label>
                                        <select id="category" name="category" class="form-control">
                                        <%
                                        	if(request.getAttribute("catList")!=null){
                                        		List<Category> catList=(List<Category>)request.getAttribute("catList");
                                        		if(catList.size()>0){
                                        			for(Category cat:catList){
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
                                        <input type="text" name="sizes" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tên sản Phẩm</label>
                                         <input type="text" name="name" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                        <label for="picture">Hình ảnh sản phẩm</label>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Giá bán</label>
                                         <input type="text" name="price" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="sale">Giảm giá</label>
                                         <input type="text" name="sale" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Tiêu đề</label>
                                        <textarea id="title" class="form-control" rows="3" name="title"></textarea>
                                    </div>
                                     <div class="form-group">
                                        <label for="highlight">Điểm nổi bật</label>
                                         <input type="text" name="highlight" class="form-control" />
                                    </div>
                                   <div class="form-group">
                                        <label for="new_product">Sản phẩm mới</label>
                                         <input type="text" name="new_product" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" rows="" name="detail"></textarea>
                                    </div>
                                    
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
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
    document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>