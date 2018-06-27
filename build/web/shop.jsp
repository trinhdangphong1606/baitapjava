<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="beans.Product"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="beans.User"%> 
<!DOCTYPE HTML>
<html>
    <head>
        <title>Free Adidas Website Template | Shop :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.easydropdown.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".dropdown img.flag").addClass("flagvisibility");

                $(".dropdown dt a").click(function () {
                    $(".dropdown dd ul").toggle();
                });

                $(".dropdown dd ul li a").click(function () {
                    var text = $(this).html();
                    $(".dropdown dt a span").html(text);
                    $(".dropdown dd ul").hide();
                    $("#result").html("Selected value is: " + getSelectedValue("sample"));
                });

                function getSelectedValue(id) {
                    return $("#" + id).find("dt a span.value").html();
                }

                $(document).bind('click', function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.parents().hasClass("dropdown"))
                        $(".dropdown dd ul").hide();
                });


                $("#flagSwitcher").click(function () {
                    $(".dropdown img.flag").toggleClass("flagvisibility");
                });
            });
        </script>
        <!-- start menu -->     
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!-- end menu -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- top scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>		
    </head>
    
        <div class="header-top">
            <div class="wrap"> 
                <div class="logo">
                    <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
                </div>
                <div class="cssmenu">
                    <ul>
                        <%
                            HttpSession sessionUser = request.getSession(false);

                            String us = (String) sessionUser.getAttribute("user");

                            User user_of_techworld3g = new User();
                            user_of_techworld3g.setUser(us);
                            user_of_techworld3g.GetUser();
                            if (user_of_techworld3g.getFirst_name().length() == 0) {
                        %>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                            <% } else {%>
                        <li><a> Welcome <%=user_of_techworld3g.getFirst_name()%></a></li>
                        <li><a href="LoginController"> Logout </a> </li>

                        <%}%> 
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
                <div class="rsidebar span_1_of_left">
                    <section  class="sky-form">
                        <h4>Sex</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <form action="<%= request.getContextPath() %>/ProductController">
                                    <select name="sex">
                                        <option value="0" selected="selected">All</option>
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                    </select>
                                    <button>Search</button>
                                </form>
                            </div>
                        </div>
                    </section>
                    <section  class="sky-form">
                        <h4>Occasion</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Athletic (20)</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Casual (45)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Casual (45)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                            </div>
                        </div>
                        <h4>Category</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Flats (70)</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Heels (38)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                            </div>
                        </div>
                        <h4>Styles</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Athletic (20)</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Ballerina (5)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Pumps (7)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>High Tops (2)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                            </div>
                        </div>
                    </section>
                    <section  class="sky-form">
                        <h4>Brand</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Adidas by Stella McCartney</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Asics</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bloch</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bloch Kids</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Capezio</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Capezio Kids</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nike</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Zumba</label>
                            </div>
                        </div>
                    </section>
                    <section  class="sky-form">
                        <h4>Heel Height</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Flat (20)</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Under 1in(5)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>1in - 1 3/4 in(5)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>2in - 2 3/4 in(3)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>3in - 3 3/4 in(2)</label>
                            </div>
                        </div>
                    </section>
                    <section  class="sky-form">
                        <h4>Price</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>$50.00 and Under (30)</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$100.00 and Under (30)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$200.00 and Under (30)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$300.00 and Under (30)</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$400.00 and Under (30)</label>
                            </div>
                        </div>
                    </section>
                    <section  class="sky-form">
                        <h4>Colors</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Red</label>
                            </div>
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Green</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Black</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yellow</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Orange</label>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="cont span_2_of_3">
                    <div class="mens-toolbar">
                        <div class="sort">
                            <div class="sort-by">
                                <label>Sort By</label>
                                <select>
                                    <option value="">
                                        Popularity               </option>
                                    <option value="">
                                        Price : High to Low               </option>
                                    <option value="">
                                        Price : Low to High               </option>
                                </select>
                                <a href=""><img src="images/arrow2.gif" alt="" class="v-middle"></a>
                            </div>
                        </div>
                        <div class="pager">   
                            <div class="limiter visible-desktop">
                                <label>Show</label>
                                <select>
                                    <option value="" selected="selected">
                                        9                </option>
                                    <option value="">
                                        15                </option>
                                    <option value="">
                                        30                </option>
                                </select> per page        
                            </div>
                            <ul class="dc_pagination dc_paginationA dc_paginationA06">
                                <li><a href="#" class="previous">Pages</a></li>
                                <%
                                    int numberOfPage = (Integer) request.getAttribute("numberOfPage");
                                    int categoryID = (Integer) request.getAttribute("categoryID");
                                    int sex = (Integer) request.getAttribute("sex");
                                    for(int i = 1; i < numberOfPage + 1; i++) {
                                %>
                                <li><a href="<%= request.getContextPath() %>/ProductController?categoryID=<%= categoryID %>&sex=<%= sex %>&page=<%= i %>"><%= i %></a></li>
                                <%
                                    }
                                %>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <%
                        Product[] products =  (Product[])(request.getAttribute("dssp"));
                        int len = products.length;
                        if (len > 1) {
                            int partitionSize = 3;
                            List<Product[]> partitions = new ArrayList<Product[]>();
                            for (int i = 0; i < len; i += partitionSize) {
                                partitions.add(Arrays.copyOfRange(products, i, Math.min(i + partitionSize, len)));
                            }
                            for(Product[] row : partitions)
                            {
                                int cols = row.length;
                                %>
                    <div class="box1">
                    <%
                                for(int j = 0; j < cols; j++)
                                {
                                    Product single = row[j];
                    %>
                        <div class="col_1_of_single1 span_1_of_single1">
                            <a href="single.jsp">                            </a>

                                <div class="view1 view-fifth1">
                                    <div class="top_box">
                                        <h3 class="m_1"><%= single.getProductName() %></h3>
                                        <p class="m_2"><%= single.getProductName2() %>   </p>
                                        <div class="grid_img">
                                            <div class="css3"><img src="images/pic11.jpg" alt=""/></div>
                                            <div class="mask1">
                                                <div class="info">Quick View</div>
                                            </div>
                                        </div>
                                        <div class="price">£<%= single.getProductPrice() %></div>
                                    </div>
                                </div>
                                <span class="rating1">
                                    <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                    <label for="rating-input-1-5" class="rating-star1"></label>
                                    <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                    <label for="rating-input-1-4" class="rating-star1"></label>
                                    <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                    <label for="rating-input-1-3" class="rating-star1"></label>
                                    <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                    <label for="rating-input-1-2" class="rating-star"></label>
                                    <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                    <label for="rating-input-1-1" class="rating-star"></label>&nbsp;
                                    (45)
                                </span>
                                <ul class="list2">
                                    <li>
                                        <img src="images/plus.png" alt=""/>
                                        <ul class="icon1 sub-icon1 profile_img">
                                            <li><form method="POST" action="<%= request.getContextPath() %>/CartServlet">
                                                    <input name="command" value="plus" type="hidden" />
                                                    <input name="productID" value="<%= single.getProductID() %>" type="hidden" />
                                                    <button class="active-icon c1" href="#">Add To Bag </button>
                                                </form>
                                                <ul class="sub-icon1 list">
                                                    <li><h3>sed diam nonummy</h3><a href=""></a></li>
                                                    <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="clear"></div>
                        </div>
                    <%
                                }
                    %>
                        <div class="clear"></div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <div class="clear"></div>
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
            $(document).ready(function () {

                var defaults = {
                    containerID: 'toTop', // fading element id
                    containerHoverID: 'toTopHover', // fading element hover id
                    scrollSpeed: 1200,
                    easingType: 'linear'
                };


                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
    
</html>