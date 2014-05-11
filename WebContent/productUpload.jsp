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

	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">

	 
    <div class="row-fluid">
            	<div class="span6">
                <form action="">
               <div id="formfields">
               title:<input type="text" id="title" name="title"/><br />
               description:<textarea id="description" name="description"></textarea><br />
               
Category:<select id="category" name="category"> 
<option value="Men">Men</option>
<option value="Women">Women</option>
<option value="Kids">Kids</option>

</select><br />
subcategory:
<select id="subcat" name="subcat">
<option value="Clothing">Clothing</option>
<option value="Footwear">Footwear</option>
</select>
Super Sub Category:<select id="supersubcategory" name="supersubcategory"> 
<option value="T-shirts">T-shirts</option>
<option value="Sarees">Sarees</option>
<option value="Casuals">Casuals</option>
<option value="Kurthis">Kurthis</option>
</select><br />
  price<input type="text" id="price" name="price"/><br />
 discounts<input type="text" id="discounts" name="discounts"/><br />
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
  <div id="check">
  XS <input type="checkbox" name="size" id="size" value="XS"/>/
 S <input type="checkbox" name="size" id="size" value="S"/>/
  M <input type="checkbox" name="size" id="size" value="M"/>/
   L <input type="checkbox" name="size" id="size" value="L"/>/
    XL <input type="checkbox" name="size" id="size" value="XL"/>/
    XXL <input type="checkbox" name="size" id="size" value="XXL"/>/
     <input type="text" value="" id="textbox"/> 
</div>
material:<input type="text" id="material" name="material" value=""/><br />
sleeves:<select id="Sleeves">
<option value="Sleeve less">Sleeve less</option>
<option value="Half Sleeves">Half Sleeves</option>
<option value="Full sleeves">Full sleeves</option>
</select><br>
      fit:<input type="text" name="fit" id="fit" value=""/>   
      color:     <br>
 <script>
$(document).ready(function(){
	//alert("1");
  $("#Checkk input:checkbox").click(function(){
	//  alert("2");
	var xx=$("#textbox2").val();
	var yy=$(this).val();
	xx=yy+'@@@'+xx;
	$("#textbox2").val(xx);
	//alert(xx);
  });
});
</script>
<div id="Checkk">
  Red <input type="checkbox" name="size" id="size" value="Red"/>/
 Blue <input type="checkbox" name="size" id="size" value="Blue"/>/
  Green <input type="checkbox" name="size" id="size" value="Green"/>/
   Black <input type="checkbox" name="size" id="size" value="Black"/>/
    Grey <input type="checkbox" name="size" id="size" value="Grey"/>/
    Pink <input type="checkbox" name="size" id="size" value="Pink"/>/
     <input type="text" value="" id="textbox2"/> 
 </div>  

    <br>
Neck:<input type="text" value="" name="neck" id="neck"/>
Wash care: <textarea name="washcare" id="washcare"></textarea>
Quantity:<input type="text" name="quantity" id="quantity"/>
<input type="button" id="submitshopkeeper" value="submit"/>
</div>
                </form>
                <form action="ShopCoverImageController" method="post" enctype= "multipart/form-data">
                <div id="coverpage" style="display: none;">
                <input type="hidden" value="" id="shopid" name="shopid"/>
                Image1:<input type="file" id="Image1" name="Image1"/>
                 Image2:<input type="file" id="Image2" name="Image2"/>
                  Image3:<input type="file" id="Image3" name="Image3"/>
                   Image4:<input type="file" id="Image4" name="Image4"/>
                    Image5:<input type="file" id="Image5" name="Image5"/>
                     Image6:<input type="file" id="Image6" name="Image6"/>
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