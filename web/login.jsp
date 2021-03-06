<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Free Adidas Website Template | Login :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
<!-- start menu -->     
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- end menu -->
<!-- top scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
   <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
        <script src="//www.google.com/recaptcha/api.js"></script>
</head>
<body>
                         <%
                              HttpSession sessionUser=request.getSession(false);  
                             
                              String noti =(String)sessionUser.getAttribute("register");
                              sessionUser.setAttribute("register", "");
                         %>
                         <%=noti%>
  <div class="header-top">
	 <div class="wrap"> 
		<div class="logo">
			<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
	    </div>
	    <div class="cssmenu">
		   <ul>
                       <li><a href="shop.jsp">Shop</a></li>
			 <li class="active"><a href="register.jsp">Sign up</a></li> 
			  
			 <li><a href="checkout.jsp">CheckOut</a></li> 
		   </ul>
		</div>
		<ul class="icon2 sub-icon2 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon2 list">
					<li><h3>Products</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
		<div class="clear"></div>
 	</div>
   </div>
   <div class="header-bottom">
   	<div class="wrap">
   		<!-- start header menu -->
		<ul class="megamenu skyblue">
		    <li><a class="color1" href="index.jsp">Home</a></li>
                    <li><a class="color1" href="ProductController?categoryID=1">Football</a></li>
                    <li><a class="color2" href="ProductController?categoryID=3">Basketball</a></li>
                    <li><a class="color3" href="ProductController?categoryID=2">Running</a></li>
                    <li><a class="color4" href="ProductController?categoryID=4">Training</a></li>
                    <li><a class="color5" href="ProductController?categoryID=6">Originals</a></li>
                    <li><a class="color6" href="ProductController?categoryID=5">Clothing</a></li>
                    <li><a class="color6" href="about.jsp">About Us</a></li>
		   </ul>
		   <div class="clear"></div>
     	</div>
       </div>
       <div class="login">
          <div class="wrap">
				<div class="col_1_of_login span_1_of_login">
					<h4 class="title">New Customers</h4>
					<h5 class="sub_title">Register Account</h5>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan</p>
					<div class="button1">
					   <a href="register.jsp"><input type="submit" name="Submit" value="Continue"></a>
					 </div>
					 <div class="clear"></div>
				</div>
				<div class="col_1_of_login span_1_of_login">
				  <div class="login-title">
	           		<h4 class="title">Registered Customers</h4>
					 <div class="comments-area">
                                                <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
						<form action="LoginController" method="post">
                                                    
							<p>
								<label>Username</label>
								<span>*</span>
								<input type="text" name="user" value="">
							</p>
							<p>
								<label>Password</label>
								<span>*</span>
								<input type="password" name="pwd" value=""/>
							</p>
                                                        <p>
                                                                <div class="g-recaptcha"
                                                                data-sitekey="6LeKM14UAAAAABuuMIfsWSFQX5Zl1VLhOvupZqMd"></div>
                                                        </p>
                                                        <%
                                                            String warning=(String)sessionUser.getAttribute("captcha");
                                                            sessionUser.setAttribute("captcha", "");
                                                        %>
                                                        <p><%=warning%></p>
							 <p id="login-form-remember">
								<label><a href="#">Forget Your Password ? </a></label>
							 </p>
							 <p>
								<input type="submit" value="Login">
							</p>
						</form>
					</div>
			      </div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
        <div class="footer">
       	  <div class="footer-top">
       		<div class="wrap">
       			   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	 <ul class="f_list">
				  	 	<li><img src="images/f_icon.png" alt=""/><span class="delivery">Free delivery on all orders over £100*</span></li>
				  	 </ul>
				   </div>
				   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	<ul class="f_list">
				  	 	<li><img src="images/f_icon1.png" alt=""/><span class="delivery">Customer Service :<span class="orange"> (800) 000-2587 (freephone)</span></span></li>
				  	 </ul>
				   </div>
				   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	<ul class="f_list">
				  	 	<li><img src="images/f_icon2.png" alt=""/><span class="delivery">Fast delivery & free returns</span></li>
				  	 </ul>
				   </div>
				  <div class="clear"></div>
			 </div>
       	 </div>
       	 <div class="footer-middle">
       	 	<div class="wrap">
       	 		<div class="section group">
				<div class="col_1_of_middle span_1_of_middle">
					<dl id="sample" class="dropdown">
			        <dt><a href="#"><span>Please Select a Country</span></a></dt>
			        <dd>
			            <ul>
			                <li><a href="#">Australia<img class="flag" src="images/as.png" alt="" /><span class="value">AS</span></a></li>
			                <li><a href="#">Sri Lanka<img class="flag" src="images/srl.png" alt="" /><span class="value">SL</span></a></li>
			                <li><a href="#">Newziland<img class="flag" src="images/nz.png" alt="" /><span class="value">NZ</span></a></li>
			                <li><a href="#">Pakistan<img class="flag" src="images/pk.png" alt="" /><span class="value">Pk</span></a></li>
			                <li><a href="#">United Kingdom<img class="flag" src="images/uk.png" alt="" /><span class="value">UK</span></a></li>
			                <li><a href="#">United States<img class="flag" src="images/us.png" alt="" /><span class="value">US</span></a></li>
			            </ul>
			         </dd>
   				    </dl>
   				 </div>
				<div class="col_1_of_middle span_1_of_middle">
					<ul class="f_list1">
						<li><span class="m_8">Sign up for email and Get 15% off</span>
						<div class="search">	  
							<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
							<input type="submit" value="Subscribe" id="submit" name="submit">
							<div id="response"> </div>
			 			</div><div class="clear"></div>
			 		    </li>
					</ul>
				</div>
				<div class="clear"></div>
			   </div>
       	 	</div>
       	 </div>
    
       	 	<div class="wrap">
       	 		<div class="section group">
				<div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Shop</h3>
					<ul class="sub_list">
						<h4 class="m_10">Men</h4>
					    <li><a href="shop.html">Men's Shoes</a></li>
			            <li><a href="shop.html">Men's Clothing</a></li>
			            
			        </ul>
			             <ul class="sub_list">
				            <h4 class="m_10">Women</h4>
				            <li><a href="shop.html">Women's Shoes</a></li>
				            <li><a href="shop.html">Women's Clothing</a></li>
				           
				         </ul>
				      
				       
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Sports</h3>
					<ul class="list1">
					    <li><a href="shop.html">Basketball Shoes</a></li>
			            <li><a href="shop.html">Football Shoes</a></li>
			           
			            <li><a href="shop.html">Running Shoes</a></li>
			           
			            <li><a href="shop.html">Running Clothing</a></li>
			           
			            <li><a href="shop.html">Training Shoes</a></li>
			            <li><a href="shop.html">Training Clothing</a></li>
			            
			            
			            <li><a href="shop.html">All Sports</a></li>
			         </ul>
				</div>
				<div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Basketball</h3>
					<ul class="list1">
					    <li><a href="shop.html">Basketball Shoes</a></li>
                                            <li><a href="shop.html">Basketball Clothing</a></li>
			            
			            <li><a href="shop.html">Men's Basketball</a></li>
			            
			            
			            <li><a href="shop.html">All Basketball</a></li>
		            </ul>
				</div>
                            
                            <div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Football</h3>
					<ul class="list1">
					    <li><a href="shop.html">Football Shoes</a></li>
			            
			            <li><a href="shop.html">Football Clothing</a></li>
			            
			            <li><a href="shop.html">Men's Football</a></li>
			            <li><a href="shop.html">Women's Football</a></li>
			            
			            <li><a href="shop.html">All Football</a></li>
		            </ul>
				</div>
                            
                            <div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Running</h3>
					<ul class="list1">
					    <li><a href="shop.html">Running Shoes</a></li>
			            
			            <li><a href="shop.html">Running Clothing</a></li>
			            
			            <li><a href="shop.html">Men's Running</a></li>
			            <li><a href="shop.html">Women's Running</a></li>
			            
			            <li><a href="shop.html">All Running</a></li>
		            </ul>
				</div>
                            
                            <div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Training</h3>
					<ul class="list1">
					    <li><a href="shop.html">Training Shoes</a></li>
			            
			            <li><a href="shop.html">Training Clothing</a></li>
			            
			            <li><a href="shop.html">Men's Training</a></li>
			            <li><a href="shop.html">Women's Training</a></li>
			            
			            <li><a href="shop.html">All Training</a></li>
		            </ul>
				</div>
                            
                            
                            
                            <div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9">Originals</h3>
					<ul class="list1">
					    <li><a href="shop.html">Originals Shoes</a></li>
			            
			            <li><a href="shop.html">Originals Clothing</a></li>
			            
			            <li><a href="shop.html">Men's Originals</a></li>
			            <li><a href="shop.html">Women's Originals</a></li>
			            
			            <li><a href="shop.html">All Originals</a></li>
		            </ul>
				</div>
				
				
				
		            <ul class="col_1_of_5 span_1_of_5">
		               <h5 class="m_9">Company Info</h5>
                                <ul class="list1">
			           <li><a href="about.jsp">About Us</a></li>
			           <li><a href="shop.jsp">Shop</a></li>
                                    <li><a href="index.jsp">Home</a></li>
			        </ul>
                            </ul>
				</div>
				<div class="clear"></div>
			</div>
       	 	
       	 </div>
       <script type="text/javascript">
			$(document).ready(function() {
			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
		</script>
        <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</body>
</html>