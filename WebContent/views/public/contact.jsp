<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/public/assets/inc/header.jsp" %><!-- 
Body Section 
-->
	<hr class="soften">
	<div class="well well-small">
	 <%
      						    String err = (String) request.getParameter("err");
      						       						 						
      						    String name=request.getParameter("name");
      						    String email=request.getParameter("email");
      						    String subject=request.getParameter("subject");
      						    String message=request.getParameter("message");
      						       						 						
      						    if("ok".equals(msg)) {
      						 %>
							<div class="alert alert-success" role="alert"Style="color: green;">
	 							<b>Thêm liên hệ thành công!</b>
							</div>
							<%
								}
																		if("off".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert"Style="color: red;">
	 							 <b>Có lỗi khi thêm liên hệ!</b>
							</div>
							<%
								}
							%>
	<h1>Visit us</h1>
	 <h3 style="color: red">${error}</h3>
	<hr class="soften"/>	
	
	<div class="row-fluid">
		<div class="span8 relative">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2711.1253605128045!2d108.16382435909179!3d16.059767448879953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219228e29da05%3A0x6710ac52496f5232!2zNyBOZ8O0IENow6JuIEzGsHUsIEhvw6AgTWluaCwgTGnDqm4gQ2hp4buDdSwgxJDDoCBO4bq1bmcgNTUwMDAwLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1605459767704!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

		<div class="absoluteBlk">
		<div class="well wellsmall">
		<h4>Contact Details</h4>
		<h5>
			Tôn Đức Thắng<br/>
			Viet Nam, Da Nang, Lien Chieu<br/><br/>
			 
			info@mysite.com<br/>
			Tel 0345678999<br/>
			Fax 123-456-5679<br/>
			web:wwwjewelry.com
		</h5>
		</div>
		</div>
		</div>
		
		<div class="span4">
		<h4>Email Us</h4>
		<h3 style="color: red">${error}</h3>
		<form class="form-horizontal" method="post">
        <fieldset>
          <div class="control-group">
           
              <input type="text" placeholder="name" name="name" value="<%if(name!=null)out.print(name);%>" class="input-xlarge"/>
           
          </div>
		   <div class="control-group">
           
              <input type="text" placeholder="email" name="email" value="<%if(email!=null)out.print(email);%>"class="input-xlarge"/>
           
          </div>
		   <div class="control-group">
           
              <input type="text" placeholder="request" name="subject" value="<%if(subject!=null)out.print(subject);%>"class="input-xlarge"/>
          
          </div>
          <div class="control-group">
              <textarea rows="3" id="textarea" name="message" class="input-xlarge"><%if(message!=null)out.print(message);%></textarea>
          </div>

            <button class="shopBtn" type="submit">Send email</button>

        </fieldset>
      </form>
		</div>
	</div>

	
</div>
<!--
Footer
-->
<%@include file="/templates/public/assets/inc/footer.jsp" %>
