﻿<%@page import="controllers.admins.cat.AdminAddCatController"%>
<%@page import="java.util.ArrayList"%>
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
                <h2>Thêm danh mục</h2>
            </div>
        </div>
        <!-- /. ROW  -->
          <%
      		String err = (String) request.getParameter("err");
           	if("3".equals(err)) {
          %>
			<div class="alert alert-danger" role="alert">
 				 Vui lòng nhập tên danh mục!
			</div>
		<%
			}
		%>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" method="post"  id="form">
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" id="name" value="" name="name" class="form-control" />
                                        <label for="name">Mô Tả</label>
                                        <textarea rows="5" cols="" type="text" id="description" value="" name="description" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                  <label>Thuộc danh mục</label>
                  <select class="form-control select2" style="width: 100%;" name="parent_id" title="Please select something!" required>
                           <option value=""></option>
                            <option value="0">Danh mục gốc</option>
                            <%
                           		List<Category> catList = new ArrayList();
                            	if(request.getAttribute("catList") != null){
                            		catList= (ArrayList<Category>) request.getAttribute("catList");
        							if(catList.size() > 0){
        								for(Category category : catList){
        									if(category.getParent_id()==0){%>
                            
                            <option value="<%=category.getId()%>"><%=category.getName()%></option>
                            <% AdminAddCatController.showCatAdd(request,out, category.getId(), "|----");
        									}
        								}
    								}
                        	}
                            %>
                      
                  </select>
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
    document.getElementById("cat").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>