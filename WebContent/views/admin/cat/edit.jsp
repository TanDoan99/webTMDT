<%@page import="controllers.admins.cat.AdminEditCatController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Category"%>
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
 								 Vui lòng nhập tên danh mục!
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
                                	if(request.getAttribute("cat")!=null){
                                  	Category cat=(Category) request.getAttribute("cat");
                                %>
                                <form role="form" action="<%=request.getContextPath()%>/admin/cat/edit?id=<%=cat.getId()%>" method="post"  id="form">
                                    <div class="form-group">
                                        <label for="name">Tên danh mục</label>
                                        <input type="text" id="name" value="<%if(cat.getName()!="")out.print(cat.getName());%>" name="name" class="form-control" />
                                    </div>
                             <label for="name">Mô Tả</label>
                             <textarea rows="5" cols="" type="text" id="description" value="" name="description" class="form-control"><%if(cat.getDescription()!="")out.print(cat.getDescription()); %></textarea>
                			  <label>Thuộc danh mục</label>
                  			  <select class="form-control select2" style="width: 100%;" name="parent_id" title="Please select something!" >
                          <%	ArrayList<Category> catList = new ArrayList();
                            	if(request.getAttribute("catList") != null){
                            		String selected = null;
                            		catList= (ArrayList<Category>) request.getAttribute("catList");
                            		
        							if(catList.size() > 0){
        								
        								for(Category category : catList){
        										
        										if(category.getParent_id()==0){%>		
        									<option  value="<%=category.getId()%>"><%=category.getName()%></option>
                          
                          <%					 AdminEditCatController.showCatEdit(request,out, category.getId(), "|----");
                						}
        							}
        				 		}
                            }
                           %>
                	  </select><br/>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                                   <%} %>
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