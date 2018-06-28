<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="beans.Product"%><!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<%@page import="beans.User"%> 

<html>
    <head>
        <title>Free Adidas Website Template | Single :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery.min.js"></script>
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
        <!----details-product-slider--->
        <!-- Include the Etalage files -->
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <!-- Include the Etalage files -->
        <script>
jQuery(document).ready(function ($) {

$('#etalage').etalage({
thumb_image_width: 300,
thumb_image_height: 400,
show_hint: true,
click_callback: function (image_anchor, instance_id) {
alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
}
});
// This is for the dropdown list example:
$('.dropdownlist').change(function () {
etalage_show($(this).find('option:selected').attr('class'));
});

});
        </script>
        <!----//details-product-slider--->	
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
    <body>
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
        <div class="single">
            <div class="wrap">
                <div class="rsidebar span_1_of_left">
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
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i></label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Black</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yellow</label>
                                <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Orange</label>
                            </div>
                        </div>
                    </section>
                </div>
                <%
                    Product single = (Product) (request.getAttribute("single"));
                %>
                <div class="cont span_2_of_3">
                    <div class="labout span_1_of_a1">
                        <!-- start product_slider -->
                        <ul id="etalage">
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image" src="hinh/<%= single.getProductImage() %>" />
                                    <img class="etalage_source_image" src="hinh/<%= single.getProductImage() %>" />
                                </a>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t2.jpg" />
                                <img class="etalage_source_image" src="images/t2.jpg" />
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t3.jpg" />
                                <img class="etalage_source_image" src="images/t3.jpg" />
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t4.jpg" />
                                <img class="etalage_source_image" src="images/t4.jpg" />
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t5.jpg" />
                                <img class="etalage_source_image" src="images/t5.jpg" />
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t6.jpg" />
                                <img class="etalage_source_image" src="images/t6.jpg" />
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/t1.jpg" />
                                <img class="etalage_source_image" src="images/t1.jpg" />
                            </li>
                        </ul>


                        <!-- end product_slider -->
                    </div>
                    <div class="cont1 span_2_of_a1">
                        <h3 class="m_3"><%= single.getProductName()%></h3>

                        <div class="price_single">
                            <span class="reducedfrom"><%= single.getProductPrice()%></span>
                            <span class="actual">$12.00</span><a href="#">click for offer</a>
                        </div>
                        <ul class="options">
                            <h4 class="m_9">Select a Size</h4>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <div class="clear"></div>
                        </ul>
                        <div class="btn_form">
                            <form>
                                <input type="submit" value="buy now" title="">
                            </form>
                        </div>
                        <ul class="add-to-links">
                            <li><img src="images/wish.png" alt=""/><a href="#">Add to wishlist</a></li>
                        </ul>
                        <p class="m_desc"><%= single.getProductDescription()%></p>

                        <div class="social_single">	
                            <ul>	
                                <li class="fb"><a href="#"><span> </span></a></li>
                                <li class="tw"><a href="#"><span> </span></a></li>
                                <li class="g_plus"><a href="#"><span> </span></a></li>
                                <li class="rss"><a href="#"><span> </span></a></li>		
                            </ul>
                        </div>
                    </div>
                    <div class="clear"></div>


                    <ul id="flexiselDemo3">
                        <li><img src="images/pic11.jpg" /><div class="grid-flex"><a href="#">Bloch</a><p>Rs 850</p></div></li>
                        <li><img src="images/pic10.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>
                        <li><img src="images/pic9.jpg" /><div class="grid-flex"><a href="#">Zumba</a><p>Rs 850</p></div></li>
                        <li><img src="images/pic8.jpg" /><div class="grid-flex"><a href="#">Bloch</a><p>Rs 850</p></div></li>
                        <li><img src="images/pic7.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>
                    </ul>
                    <script type="text/javascript">
                        $(window).load(function () {
                            $("#flexiselDemo1").flexisel();
                            $("#flexiselDemo2").flexisel({
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 1
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 2
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });

                            $("#flexiselDemo3").flexisel({
                                visibleItems: 5,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 1
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 2
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });

                        });
                    </script>
                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                    <div class="toogle">
                        <h3 class="m_3">Product Details</h3>
                        <p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
                    </div>					
                    <div class="toogle">
                        <h3 class="m_3">Product Reviews</h3>
                        <p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
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
                                        <input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                                    this.value = 'Search';
                                                                }">
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
    </body>
</html>