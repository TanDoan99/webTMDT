<%@page import="controllers.publics.PublicIndexController"%>
<%@page import="utils.StringUtil"%>
<%@page import="daos.CatDAO"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<div id="sidebar" class="span3">
<div class="well well-small">
	<div class="widget accordion-widget category-accordions">
    <h1 class="border">Category Tree</h1>
    <div class="accordion">
		<%
 	  CatDAO catDAO=new CatDAO();
      List<Category> catList= catDAO.findAll();
         if(catList.size()>0){
        	
          for(Category objCat:catList){
        	  if(objCat.getParent_id()==0){
          	String catName=objCat.getName();
          	//String urlSlug = request.getContextPath()+"/loai-san-pham/"+StringUtil.makeSlug(objCat.getName())+"-"+objCat.getId()+".html";
 		 %>
 		 	<div class="accordion-group">
            					<div class="accordion-heading">	
                        		 <a Style="text-decoration: none;" class="accordion-toggle collapsed" data-toggle="collapse" href="#<%=objCat.getId()%>"><%=catName%></a>
                     			</div>
           							 <div id="<%=objCat.getId()%>" class="accordion-body collapse">
               							 <div  class="accordion-inner">
               			<%PublicIndexController.showCat(request, out, objCat.getId()); %>
		 				 </div><!-- /.accordion-inner -->
   					 	 </div>
						 </div><!-- /.accordion-group -->		
		<% }}} %>
	<br/>
	<a class="totalInCart" href="cart.html"><strong>Total Amount  <span class="badge badge-warning pull-right" style="line-height:18px;">$448.42</span></strong></a>
</div>
</div>
</div>

			  <div class="well well-small alert alert-warning cntr">
				  <h2 style="font-family: 'Oswald', sans-serif;">50% Discount</h2>
				  <p> 
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="#"><img src="<%=request.getContextPath()%>/templates/public/assets/img/paypal.jpg" alt="payment method paypal"></a></div>
			
			<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="<%=request.getContextPath()%>/templates/public/assets/img/bootstrap-ecommerce-templates.PNG" alt="bootstrap ecommerce templates">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="<%=request.getContextPath()%>/templates/public/assets/img/shopping-cart-template.PNG" alt="shopping cart template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="<%=request.getContextPath()%>/templates/public/assets/img/bootstrap-template.png" alt="bootstrap template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
		  </ul>

	</div>