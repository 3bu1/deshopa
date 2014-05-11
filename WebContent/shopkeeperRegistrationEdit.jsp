<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.HashMap"%>
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
<jsp:useBean id="shopdetails" class="database.Select"/>
</head>
<body>

	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">

	 
    <div class="row-fluid">
            	<div class="span6">
                <form action="">
               <div id="formfields">
               <%
                HashMap listing= (HashMap)shopdetails.selectwhere("shopkeeperregistration", "shopid", shopid); %>
                <input type="text" id="shopid" value="<%=listing.get(2)%>"/>
                Name of Shop:<input type="text" id="NameOfShop" name="NameOfShop" value="<%=listing.get(3)%>"/><br />
                Owner Name:<input type="text" id="OwnerName" name="OwnerName" value="<%=listing.get(4)%>"/><br />
  Shop Email:<input type="email" id="email" name="email" value="<%=listing.get(5)%>"/><br />
  password<input type="password" id="password" name="password" value="<%=listing.get(6)%>"/><br />

Contact Number:<input type="tel" id="ContactNumber1" name="ContactNumber1" value="<%=listing.get(7)%>"/><br />
Category:<select id="Category" name="Category"> 
<option value="<%=listing.get(8)%>"><%=listing.get(8)%></option>
<option value="Clothing">Clothing</option>
<option value="FootWear">FootWear</option>
<option value="Electronics">Electronics</option>
<option value="Media">Media</option>
<option value="Books">Books</option>
</select><br />
<input type="button" id="submitshopkeeper" value="submit"/>
</div>
                </form>
                <form action="ShopCoverImageController" method="post" enctype= "multipart/form-data">
                <div id="coverpage" style="display: none;">
                <input type="text" value="" id="shopid" name="shopid"/>
                Coverpage Photo:<input type="file" id="coverimage" name="coverimage"/>
                <input type="submit" id="coverpagebutton" value="save photo"/></div><br />
                </form>
                <div id="insertioncompleted"></div>
                </div>
            	<div class="span6"></div>
            	
            </div>
	</div>
    
	<%@ include file="footer.jsp" %> 
<script>
$(document).ready(function(){
$("#submitshopkeeper").click(function(event){
	//alert("1");
	  event.preventDefault();
	  NameOfShop=$("#NameOfShop").val();
	   OwnerName = $("#OwnerName").val();
	   email = $("#email").val();
	   password = $("#password").val();
	   ContactNumber1 = $("#ContactNumber1").val();
	   Category = $("#Category option:selected").val();
	   shopid= $("#shopid").val();
	   //alert("1"+NameOfShop+":::::"+Category);
    $.post("ShopKeeperRegistrationController",
	{
    OwnerName : OwnerName,
	email: email,
	password :password,
	NameOfShop: NameOfShop,
	ContactNumber1:ContactNumber1,
	Category:Category,
	edit:'editfeature',
	shopid:shopid,
	}
	,function(data,status){
		var shopid =data.trim().split(":::");
		$("#formfields").hide();
		$("#coverpage").show(); 
		$("#insertioncompleted").empty().append(shopid[0]);
		$("#shopid").val(shopid[1]);
		});
  });
});
</script>
</body></html>