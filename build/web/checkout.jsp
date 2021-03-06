<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="beans.Item"%>
<%@page import="beans.Product"%>
<%@page import="beans.Cart"%>
<%@page import="beans.User"%>   
<html>
<head>
<title>Free Adidas Website Template | Checkout :: w3layouts</title>
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
</head>
<body>
  <div class="header-top">
	 <div class="wrap"> 
		<div class="logo">
			<a href="index.jsp"><img src="images/logo.png" alt=""/></a>
	    </div>
	    <div class="cssmenu">
		   <ul>
                         <li><a href="shop.jsp">Store Locator</a></li>
			  <%
                              HttpSession sessionUser=request.getSession(false);  
                             
                              String us=(String)sessionUser.getAttribute("user");
                                
                              User user_of_techworld3g = new User();
                              user_of_techworld3g.setUser(us);
                              user_of_techworld3g.GetUser();
                              if(user_of_techworld3g.getFirst_name().length()==0)
                              {
                         %>
			 <li><a href="login.jsp">Login</a></li>
                         <li><a href="register.jsp">Register</a></li>
                         <% }
                         else
                         {%>
                         <li><a> Welcome <%=user_of_techworld3g.getFirst_name()%></a></li>
                         <li><a href="LoginController"> Logout </a> </li>
                             
                         <%} %> 
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
                    
                    <li class="grid"><a class="color2" href="#">Men</a>
				
				</li>
  			   <li class="active grid"><a class="color4" href="#">Women</a>
				
    			</li>				
				<li><a class="color1" href="ProductController?categoryID=2">Football</a></li>
                                <li><a class="color2" href="#">Basketball</a></li>
                                <li><a class="color3" href="#">Running</a></li>
				<li><a class="color4" href="#">Training</a></li>
				<li><a class="color5" href="#">Originals</a></li>
				<li><a class="color6" href="#">Clothing</a></li>
                                <li><a class="color6" href="about.jsp">About Us</a></li>
		   </ul>
		   <div class="clear"></div>
     	</div>
       </div>
       <div class="login">
         <div class="wrap">
             <%
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
            %>
            <h4 class="title">Shopping cart is empty</h4>
            <p class="cart">You have no items in your shopping cart.<br>Click<a href="index.jsp"> here</a> to continue shopping</p>
            <%
                } else {
                    HashMap<Integer, Item> cartItems = cart.getCartItems();
                    Iterator it = cartItems.entrySet().iterator();
            %>
                <table>
                    <tr>
                      <th>Product name</th>
                      <th>Quantity</th> 
                      <th>Actions</th>
                    </tr>
            <%
                    while (it.hasNext()) {
                        HashMap.Entry pair = (HashMap.Entry)it.next();
                        Item cartItem = (Item) pair.getValue();
                        Product product = cartItem.getProduct();
            %>
                <tr>
                    <td><%= product.getProductName() %></td>
                    <td><%= cartItem.getQuantity() %></td> 
                    <td>
                        <form method="POST" action="<%= request.getContextPath() %>/CartServlet">
                            <input name="command" value="plus" type="hidden" />
                            <input name="productID" value="<%= product.getProductID() %>" type="hidden" />
                            <button>Plus</button>
                        </form>
                        <form method="POST" action="<%= request.getContextPath() %>/CartServlet">
                            <input name="command" value="delete" type="hidden" />
                            <input name="productID" value="<%= product.getProductID() %>" type="hidden" />
                            <button>Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                    }
            %>
                <tr>
                    <td>
                        <form method="POST" action="<%= request.getContextPath() %>/CheckoutServlet">
                            <button>Checkout</button>
                        </form>
                    </td>
                </tr>
                </table>
            <%
                }
            %>
         </div>
        </div>
        <div class="footer">
       	  <div class="footer-top">
       		<div class="wrap">
       			   <div class="col_1_of_footer-top span_1_of_footer-top">
				  	 <ul class="f_list">
				  	 	<li><img src="images/f_icon.png" alt=""/><span class="delivery">Free delivery on all orders over �100*</span></li>
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
       	 <div class="copy">
       	   <div class="wrap">
       	 	  <p>� All rights reserved | Template by&nbsp;<a href="http://w3layouts.com/"> W3Layouts</a></p>
       	   </div>
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