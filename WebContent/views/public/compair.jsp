<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %>
<!-- 
Body Section 
-->
	<div class="row">
	<%@include file="/templates/public/assets/inc/sidebar.jsp" %>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Products Compairsition</li>
    </ul>
	<div class="well well-small">
	<h3> Products Compairsition <small class="pull-right"> 2 products are compaired </small></h3>	
	<hr class="soft"/>
	
	<table id="compairTbl" class="table table-bordered">
              <thead>
                <tr>
                  <th>Features</th>
                  <th>Product1 name here </th>
                  <th>Product2 name here</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>&nbsp;</td>
                  <td>
					<p class="justify">
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies - that is why our 
						goods are so popular and we have a great number of faithful customers all over the country.
					</p>
				<img src="<%=request.getContextPath()%>/templates/public/assets/img/d.jpg" alt=""/>
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3><br/>
				<div class="btn-group">
				 <a href="product_details.html" class="defaultBtn btn-large"><span class=" icon-shopping-cart"></span> Add to cart</a>
				 <a href="product_details.html" class="shopBtn btn-large">VIEW</a>
				 </div>
				</form>
				</td>
                  <td>
				  <p class="justify">
					Nowadays the lingerie industry is one of the most successful business spheres.
					We always stay in touch with the latest fashion tendencies - that is why our 
					goods are so popular and we have a great number of faithful customers all over the country.
				</p>
				<img src="<%=request.getContextPath()%>/templates/public/assets/img/e.jpg" alt=""/>
				
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<br/>
				<div class="btn-group">
				 <a href="product_details.html" class="defaultBtn btn-large"><span class=" icon-shopping-cart"></span> Add to cart</a>
				 <a href="product_details.html" class="shopBtn btn-large">VIEW</a>
				 </div>
				</form>
				  </td>
                </tr>
                <tr>
                  <td>Height</td>
                  <td>5"</td>
                  <td>15"</td>
                </tr>
                <tr>
                  <td>Deepth</td>
                  <td>5"</td>
                  <td>5"</td>
                </tr>
				<tr>
                  <td>Size</td>
                  <td>XXL</td>
                  <td>XL</td>
                </tr>
				<tr>
                  <td>Width</td>
                  <td>6.5"</td>
                  <td>6"</td>
                </tr>
				<tr>
                  <td>Weight</td>
                  <td>0.5kg</td>
                  <td>0.8kg</td>
                </tr>
              </tbody>
            </table>		
	<div class="alignR"><a href="products.html" class="shopBtn btn-large">Back to Products Page</a></div>
	</div>
	
</div>
</div>
<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>