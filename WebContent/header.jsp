<%@page import="java.util.HashMap"%>
<%@page import="database.Select,java.util.Map"%>
<link rel="stylesheet" href="css/layerslider.css" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css/media.css" type="text/css">
	<link rel="stylesheet" href="css/flexislider.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>
<!--[if lt IE 9]>
		<script src="js/html5shiv.min.js"></script>
	<![endif]--> 
    
    <link rel="stylesheet" id="switcher-css" type="text/css" href="css/switcher.css" media="all">
	<link rel="alternate stylesheet" type="text/css" href="css/orange.css" title="orange" media="all">
    <!-- END Switcher Styles -->
    
<link rel="stylesheet" href="css/skin.css" type="text/css"></head>
<!-- Latest compiled and minified CSS -->

<%
Select se = new Select();
String shopid = "";HashMap listings =null;
if(session.getAttribute("shopid")!=null){
	shopid=session.getAttribute("shopid").toString(); 
	listings=se.selectwhere("shopkeeperregistration", "shopid", shopid);	
}
	
	
	%>
<!-- Start Top Bar -->
    <div class="container tophead">
    	<div class="left span3">
        	<ul class="social">
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Like us on Facebook"><i class="icon-facebook"></i></i></a></li>
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Follow us on Twitter"><i class="icon-twitter"></i></a></li>
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Circle us on Google Plus"><i class="icon-google-plus"></i></a></li>
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Follow us on Linkedin"><i class="icon-linkedin"></i></a></li>
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Be friend on Xing"><i class="icon-xing"></i></a></li>
            	<li><a title="" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Pin it on Pinterest"><i class="icon-pinterest"></i></a></li>
            </ul>
        </div>
        <div class="right">
                <div id="wdt-links">
                    <ul>
                        <li class="dropdown hover cart"><a href="index.html#"><i class="icon-shopping-cart"></i> Your Cart <span class="label label-success font14">3 item(s)</span> - $171.50 <i class="icon-arrow-down"></i></a>
                          <ul class="dropdown-menu topcart">
                            <li>
                              <table>
                                <tbody>
                                  <tr>
                                    <td class="image"><a href="product.html"><img title="product" alt="product" src="file:///C:/Users/tribhuvan/Desktop/Designing%20Media%20Works_files/01_menu.jpg" height="50" width="50"></a></td>
                                    <td class="name"><a href="product.html">Bag</a></td>
                                    <td class="quantity">x&nbsp;3</td>
                                    <td class="total">$143.50</td>
                                    <td class="remove"><i class="icon-remove "></i></td>
                                  </tr>
                                </tbody>
                              </table>
                              <table>
                                <tbody>
                                  <tr>
                                    <td class="textright"><b>Sub-Total:</b></td>
                                    <td class="textright">$143.00</td>
                                  </tr>
                                  <tr>
                                    <td class="textright"><b>Eco Tax (-2.00):</b></td>
                                    <td class="textright">$21.00</td>
                                  </tr>
                                  <tr>
                                    <td class="textright"><b>VAT (17.5%):</b></td>
                                    <td class="textright">$7.50</td>
                                  </tr>
                                  <tr>
                                    <td class="textright"><b>Total:</b></td>
                                    <td class="textright">$171.50</td>
                                  </tr>
                                </tbody>
                              </table>
                              <div class="well pull-right">
                                <a href="checkout.html" class="btn btn-general">Checkout</a>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <%if(shopid.equals("")){ %>
                        <li class="register"><a href="shopkeeperRegistrationForm.jsp" id="wdt-register">Register <i class="icon-user"></i></a></li>
                        <li><a href="login.jsp">Login <i class="icon-unlock-alt"></i></a></li><%}else{ %>
                        <li class="register"><a href="shopAddressEditForm.jsp" id="wdt-register">Myaccount <i class="icon-user"></i></a></li>
                        <li><a href="login.jsp">Logout<i class="icon-unlock-alt"></i></a></li><%} %>
                    </ul>
                </div>
            </div>
        </div>
	<!-- END Top Bar -->

    <!-- Start Header Bar -->
    <div class="container header-wrap make-bg">
		<div class="left brand">
           <h1><a href="index.html">DeShoppa</a></h1>
        </div>
        <div class="right">
        	<div class="searchbar span3">
                <form class="form-search">
              <input type="text" placeholder="Search 10.000+ items from 1000+ stores" data-provide="typeahead" data-items="4" data-source="">
                </form>
		    </div>
		</div>
	</div>
        
    <div class="container make-bg">
	<div class="navbar">
		<div class="container">
			<div class="navbar-inner">
                <button class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
		<div class="nav-collapse collapse">
			<ul class="nav pull-left">
				<li class="active"><a href="index.html">Home</a></li>
				<li class="dropdown dropdown-hover">
                  <a class="dropdown-toggle" href="" data-toggle="dropdown">Categories <span class="caret"></span></a>
                      <div class="dropdown-menu span4">
                        <div class="row">
                          <div class="span2">
                            <ul class="mega-menu-links">
                              <li><a href="">Woman</a></li>
                              <li><a href="">Shoes</a></li>
                              <li><a href="">Bags</a></li>
                              <li><a href="">Accessories</a></li>
                              <li><a href="">Jewellery</a></li>
                            </ul>
                          </div>
                          <div class="span2">
                            <ul class="mega-menu-links">
                              <li><a href="">Man</a></li>
                              <li><a href="">Kids</a></li>
                              <li><a href="">Wedding Apparel</a></li>
                              <li><a href="">Cosplay</a></li>
                              <li><a href="">Fur <span class="label label-success">(hot)</span></a></li>
                            </ul>
                          </div>
					   </div>
					</div>
                </li>
				<li class="dropdown dropdown-hover">
					<a href="" class="dropdown-toggle" data-toggle="dropdown">THE DEAL <span class="caret"></span></a>
                        <div class="dropdown-menu span8">
                          <ul class="thumbnails">
                            <li class="span2">
                                <div class="wdt-product active">
                                    <div class="wdt-products-wrapper">
                                        <div class="wdt-product active show">
                                            <a href="product.html" title="Pure Color Leisure">
                                                <img src="images/04_menu.jpg" alt="Pure Color Leisure">
                                            </a>
                                            <h4><a href="product.html" title="Pure Color Leisure">Pure Color Leisure</a></h4>
                                            <ul class="rating">
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-off"></i></li>
                                            </ul>
                                                <div class="wdt-pricing">
                                                    <a href="product.html" title="#"><span class="amount">€7.11</span></a>
                                                </div>
											<div class="wdt-cart">
												<div class="wdt-cart-bar">
													<a href="product.html" title="Pure Color Leisure"><i class="icon-shopping-cart"></i> Add to basket</a>
												</div>
											</div>
											<div class="wdt-overlay">
												<a href="product.html" title="#"><span class="amount">€7.11</span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="span2">
                                <div class="wdt-product active">
                                    <div class="wdt-products-wrapper">
                                        <div class="wdt-product active show">
                                            <a href="product.html" title="Cool Bag">
                                                <img src="images/01_menu.jpg" alt="Cool Bag">
                                            </a>
                                            <h4><a href="product.html" title="Title Here">Cool Bag</a></h4>
                                            <ul class="rating">
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                            </ul>
                                                <div class="wdt-pricing">
                                                    <span class="amount">€21.00</span>
                                                </div>
											<div class="wdt-cart">
												<div class="wdt-cart-bar">
													<a href="product.html" title="Title Here"><i class="icon-shopping-cart"></i> Add to basket</a>
												</div>
											</div>
											<div class="wdt-overlay">
												<a href="product.html" title="#"><span class="amount">€21.00</span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="span2">
                                <div class="wdt-product active">
                                    <div class="wdt-products-wrapper">
                                        <div class="wdt-product active show">
                                            <a href="product.html" title="Cool Bag">
                                                <img src="images/02_menu.jpg" alt="Style Fish Mouth">
                                            </a>
                                            <h4><a href="product.html" title="Style Fish Mouth">Style Fish Mouth</a></h4>
                                            <ul class="rating">
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-off"></i></li>
                                                <li><i class="star-off"></i></li>
                                            </ul>
                                                <div class="wdt-pricing">
                                                    <span class="amount">€12.00</span>
                                                </div>
											<div class="wdt-cart">
												<div class="wdt-cart-bar">
													<a href="product.html" title="Style Fish Mouth"><i class="icon-shopping-cart"></i> Add to basket</a>
												</div>
											</div>
											<div class="wdt-overlay">
												<a href="product.html" title="#"><span class="amount">€12.00</span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="span2">
                                <div class="wdt-product active">
                                    <div class="wdt-products-wrapper">
                                        <div class="wdt-product active show">
                                            <a href="product.html" title="Pendant N359 Bronze">
                                                <img src="images/03_menu.jpg" alt="Pendant N359 Bronze">
                                            </a>
                                            <h4><a href="product.html" title="Pendant N359 Bronze">Pendant N359 Bronze</a></h4>
                                            <ul class="rating">
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-on"></i></li>
                                                <li><i class="star-off"></i></li>
                                            </ul>
                                                <div class="wdt-pricing">
                                                    <span class="amount">€2.43</span>
                                                </div>
											<div class="wdt-cart">
												<div class="wdt-cart-bar">
													<a href="product.html" title="Pendant N359 Bronze"><i class="icon-shopping-cart"></i> Add to basket</a>
												</div>
											</div>
											<div class="wdt-overlay">
												<a href="product.html" title="#"><span class="amount">€2.43</span></a>
											</div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                          </ul>
                        </div><!-- .dropdown-menu -->
                      </li>
                       <li class="dropdown dropdown-hover">
                          <a class="dropdown-toggle" href="" data-toggle="dropdown">Features <span class="caret"></span></a>
                          <div class="dropdown-menu span6">
                            <div class="row">
                              <div class="span2">
                                <ul class="mega-menu-links">
                              <li><a href="">Category List</a></li>
                              <li><a href="category-grid.html">Category Grid</a></li>
                              <li><a href="category-sidebar.html">Category with Sidebar</a></li>
                              <li><a href="category-fullwidth.html">Category Fullwidth</a></li>
                              <li><a href="product-sidebar.html">Product Sidebar</a></li>
                              <li><a href="product-fullwidth.html">Product Fullwidth</a></li>
                                </ul>
                              </div>
                              <div class="span2">
                                <ul class="mega-menu-links">
                                  <li><a href="daily-deals.html">Daily Deals</a></li>
                                  <li><a href="services.html">Services</a></li>
                                  <li><a href="about.html">About Us</a></li>
                                  <li><a href="faqs.html">FAQS</a></li>
                                  <li><a href="login.html">Login Page</a></li>
                                  <li><a href="register.html">Register Page</a></li>
                                </ul>
                              </div>
                              <div class="span2">
                                <ul class="mega-menu-links">
                                  <li><a href="portfolio.html">Portfolio</a></li>
                                  <li><a href="blog.html">Blog</a></li>
                                  <li><a href="sitemap.html">Sitemap</a></li>
                                  <li><a href="404.html">404 Page</a></li>
                                  <li><a href="typography.html">Typography</a></li>
                                  <li><a href="elements.html">Elements</a></li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li><a href="shopping-cart.html">Shopping Cart</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                        <li><a href="contact.html">Contact</a></li>
                      </ul>
                        <ul class="nav pull-right">
                      <li class="dropdown dropdown-hover">
                          <a class="dropdown-toggle" href="" data-toggle="dropdown">User CP <span class="caret"></span></a>
                          <div class="dropdown-menu span4">
                           <%if(shopid.equals("")){ %>
                            <div class="row">
                              <div class="span2">
                                <p>Welcome back <strong>Guest!</strong></p>
                                <p>If you need any help please contact us via <a href="">ticket system</a> in your dashboard.</p>
                              </div>
                              <div class="span2">
                                <ul class="mega-menu-links">
                                  <li><a href="wishlist.html">Wishlist (2)</a></li>
                                  <li><a href="account.html">My Account</a></li>
                                  <li><a href="shopping-cart.html">Shopping Cart</a></li>
                                  <li><a href="checkout.html">Checkout</a></li>
                                  <li><a href="">My Tickets</a></li>
                                </ul>
                              </div>
                            </div>
                            <%}else{ %>
                            <div class="row">
                              <div class="span2">
                                <p>Welcome back <strong><%=listings.get(4) %></strong></p>
                                <p>If you need any help please contact us via <a href="">ticket system</a> in your dashboard.</p>
                              </div>
                              <div class="span2">
                                <ul class="mega-menu-links">
                                  <li><a href="productUpload.jsp">Product upload</a></li>
                                  <li><a href="shopAddressEditForm.jsp">Address Edit</a></li>
                                  <li><a href="productListing.jsp">Product Listing</a></li>
                                  <li><a href="#">My Tickets</a></li>
                                </ul>
                              </div>
                            </div>
                            <%} %>
                          </div>
                        </li>
                    </ul>
                </div>
			</div>
		</div>
	</div>
</div>
	<!-- END Header Bar -->
