<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="" id="ls-global">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    
	<!-- Set meta informations -->
	<title>DeShoppa.com</title>
	<meta name="description" content="The DeShoppa is a responsive ecommerce template for your next projects">
	<meta name="author" content="">
<link rel="stylesheet" href="css/layerslider.css" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css/media.css" type="text/css">
	<link rel="stylesheet" href="css/flexislider.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">

<!--[if lt IE 9]>
		<script src="js/html5shiv.min.js"></script>
	<![endif]--> 
    
    <link rel="stylesheet" id="switcher-css" type="text/css" href="css/switcher.css" media="all">
	<link rel="alternate stylesheet" type="text/css" href="css/orange.css" title="orange" media="all">
    <!-- END Switcher Styles -->
    
<link rel="stylesheet" href="css/skin.css" type="text/css"></head>
<!-- Latest compiled and minified CSS -->
</head>
<body>
<%session.setAttribute("shopid", null); %>
	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">

	 
    <div class="row-fluid">
            	<div class="span6">
                <form action="">
               <div id="formfields">
              
  password<input type="password" id="password" name="password"/><br />

Contact Number:<input type="tel" id="ContactNumber1" name="ContactNumber1"/><br />

 <input type="hidden" value="" id="shopid" name="shopid"/>
<input type="button" id="submitshopkeeper" value="submit"/>
</div>
                </form>
               
            </div>
	</div>
    
	<%@ include file="footer.jsp" %> 
<script>
$(document).ready(function(){
$("#submitshopkeeper").click(function(event){
	  event.preventDefault();
	  password = $("#password").val();
	  ContactNumber1 = $("#ContactNumber1").val();
	  
    $.post("Login",
	{
    password :password,
	ContactNumber1:ContactNumber1,
	
	}
	,function(data,status){
		window.location.href = "shopkeeperRegistrationEdit.jsp";
		});
  });
});
</script>
</body></html>