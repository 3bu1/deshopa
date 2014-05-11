<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.ArrayList"%>
<html lang="en" class="" id="ls-global">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage="" %>
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

	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">

	 
    <div class="row-fluid">
    <%
    String image= request.getParameter("image");
   String productid=request.getParameter("productid");
Map<Integer,String> data = null;
data=se.selectwhere("product", "productid", productid);
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>
<script>
$(window).load(function(){
 var image=$("#image").val();
 if(image=='image'){}
    $("#formfields").hide();
    $("#coverpage").show();

});
</script>
            	<div class="span6">
                <form action="">
               <div id="formfields">
               <input type="text" value="<%=image%>" name="image" id="image"/>
               <input type="hidden" value="<%=productid%>" id="productid"/>
               title:<input type="text" id="title" name="title" value="<%=data.get(3)%>"/><br />
               description:<textarea id="description" name="description" ><%=data.get(4)%></textarea><br />
               
Category:<select id="category" name="category"> 
<option value="<%=data.get(5)%>"><%=data.get(5)%></option>
<option value="Men">Men</option>
<option value="Women">Women</option>
<option value="Kids">Kids</option>

</select><br />
subcategory:
<select id="subcat" name="subcat">
<option value="<%=data.get(6)%>"><%=data.get(6)%></option>
<option value="Clothing">Clothing</option>
<option value="Footwear">Footwear</option>
</select>
Super Sub Category:<select id="supersubcategory" name="supersubcategory"> 
<option value="<%=data.get(7)%>"><%=data.get(7)%></option>
<option value="T-shirts">T-shirts</option>
<option value="Sarees">Sarees</option>
<option value="Casuals">Casuals</option>
<option value="Kurthis">Kurthis</option>
</select><br />
  price<input type="text" id="price" name="price" value="<%=data.get(8)%>"/><br />
 discounts<input type="text" id="discounts" name="discounts" value="<%=data.get(9)%>"/><br />
 size:<br>
       <script>
$(document).ready(function(){
	
  $("#check input:checkbox").click(function(){
	 
	var xx=$("#textbox").val();
	var yy=$(this).val();
	xx=yy+'@@@'+xx;
	$("#textbox").val(xx);

  });
});
</script>
<%
String[] size=null;ArrayList list = new ArrayList();
if(data.get(10).contains("@@@")){
 size =data.get(10).split("@@@");

for(int x=0;x<size.length;x++){
	list.add(size[x]);
	//System.out.println(list.get(x));
}}
%>

  <div id="check">
   XS<%if(list.contains("XS")){ %><input type="checkbox" name="size" id="size" value="XS" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="XS"/>/<%} %>
   S <%if(list.contains("S")){ %><input type="checkbox" name="size" id="size" value="S" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="S"/>/<%} %>
   M <%if(list.contains("M")){ %><input type="checkbox" name="size" id="size" value="M" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="M"/>/<%} %>
   L <%if(list.contains("L")){ %><input type="checkbox" name="size" id="size" value="L" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="L"/>/<%} %>
   XL <%if(list.contains("XL")){ %><input type="checkbox" name="size" id="size" value="XL" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="XL"/>/<%} %>
   XXL<%if(list.contains("XXL")){ %><input type="checkbox" name="size" id="size" value="XXL" checked="checked"/><%}else{ %> <input type="checkbox" name="size" id="size" value="XXL"/>/<%} %>
     <input type="text" value="<%=data.get(10) %>" id="textbox"/> 
</div>
material:<input type="text" id="material" name="material" value="<%=data.get(11)%>"/><br />
sleeves:<select id="Sleeves">
<option value="<%=data.get(12) %>"><%=data.get(12) %></option>
<option value="Sleeve less">Sleeve less</option>
<option value="Half Sleeves">Half Sleeves</option>
<option value="Full sleeves">Full sleeves</option>
</select><br>
      fit:<input type="text" name="fit" id="fit" value="<%=data.get(13) %>"/>   
      color:     <br>
 <script>
$(document).ready(function(){
	//alert("1");
  $("#Checkk input:checkbox").click(function(){
	  //alert("2");
	var xx=$("#textbox2").val();
	var yy=$(this).val();
	xx=yy+'@@@'+xx;
	$("#textbox2").val(xx);
	//alert(xx);
  });
});
</script>
<div id="Checkk">
<%
String[] color=null;list = new ArrayList();
if(data.get(14).contains("@@@")){
color =data.get(14).split("@@@");

for(int x=0;x<size.length;x++){
	list.add(color[x]);
	//System.out.println(list.get(x));
}}
%>
  Red <%if(list.contains("Red")){ %><input type="checkbox" name="size" id="size" value="Red" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Red"/>/<%} %>
 Blue <%if(list.contains("Blue")){ %><input type="checkbox" name="size" id="size" value="Blue" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Blue"/>/<%} %>
  Green <%if(list.contains("Green")){ %><input type="checkbox" name="size" id="size" value="Green" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Green"/>/<%} %>
   Black <%if(list.contains("Black")){ %><input type="checkbox" name="size" id="size" value="Black" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Black"/>/<%} %>
    Grey <%if(list.contains("Grey")){ %><input type="checkbox" name="size" id="size" value="Grey" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Grey"/>/<%} %>
    Pink <%if(list.contains("Pink")){ %><input type="checkbox" name="size" id="size" value="Pink" checked="checked"/><%}else{ %><input type="checkbox" name="size" id="size" value="Pink"/>/<%} %>
     <input type="text" value="<%=data.get(14) %>" id="textbox2"/> 
 </div>  

    <br>
Neck:<input type="text" value="<%=data.get(15) %>" name="neck" id="neck"/>
Wash care: <textarea name="washcare" id="washcare"><%=data.get(16) %></textarea>
Quantity:<input type="text" name="quantity" id="quantity" value="<%=data.get(19) %>"/>
<input type="button" id="submitshopkeeper" value="submit"/>
</div>
                </form>
                <form action="ShopCoverImageController" method="post" enctype= "multipart/form-data">
                <div id="coverpage" style="display: none;"><br>
                <input type="hidden" value="" id="shopid" name="shopid"/>
                <input type="hidden" value="<%=productid%>" id="productid"/>
                Image1:<input type="file" id="Image1" name="Image1"/><br>               
                 Image2:<input type="file" id="Image2" name="Image2"/><br>
                  Image3:<input type="file" id="Image3" name="Image3"/><br>
                   Image4:<input type="file" id="Image4" name="Image4"/><br>
                    Image5:<input type="file" id="Image5" name="Image5"/><br>
                     Image6:<input type="file" id="Image6" name="Image6"/><br>
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
	    $.post("ProductController",
	{
    	title : $("#title").val(),
    	description: $("#description").val(),
    	category : $("#category option:selected").val(),
	subcat: $("#subcat option:selected").val(),
	supersubcategory:$("#supersubcategory").val(),
	price: $("#price").val(),
	discounts: $("#discounts").val(),
	sizes: $("#textbox").val(),
	colours: $("#textbox2").val(),
	Sleeves: $("#Sleeves option:selected").val(),
	material: $("#material").val(),
	fit: $("#fit").val(),
	neck: $("#neck").val(),
	washcare: $("#washcare").val(),
	quantity: $("#quantity").val(),
	productid:$("#productid").val(),
	edit:'editfeature'
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