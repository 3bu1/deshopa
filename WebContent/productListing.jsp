<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="database.Select,java.util.Map"%>
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

    

</head>
<body >

	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">
        <div class="row-fluid">
            	<div class="span11">
                <table width="100%" border="1" cellspacing="0" cellpadding="0" style="margin-bottom:10px;">
                 <tr>
    <td width="57">Title</td>
    <td width="103">Category</td>
    <td width="148">Super Sub Category</td>
    <td width="72">Price</td>
    <td width="71">EDIT</td>
    <td width="71">Image EDIT</td>
    <td width="117">DELETE</td>
  </tr>
<%
JSONObject jsonobj =se.selectListing("product", "shopid", shopid);
HashMap<Integer,String> data = null;
data=se.selectwhere("product", "shopid", shopid); 
			for(int x=0;x<jsonobj.size();x++){
				data=(HashMap)jsonobj.get(x);
%>
	 

  <tr>
    <td><%=data.get(3) %></td>
    <td><%=data.get(5) %></td>
    <td><%=data.get(7) %></td>
    <td><%=data.get(8) %></td>
    <td><a href="productEdit.jsp?productid=<%=data.get(2)%>">Edit</a></td>
    <td><a href="productEdit.jsp?productid=<%=data.get(2)%>&image=image">Image Edit</a></td>
    <td>delete</td>
  </tr>


<%} %>                
         </table>       </div>
	</div>
    
	<%@ include file="footer.jsp" %> 

</body></html>