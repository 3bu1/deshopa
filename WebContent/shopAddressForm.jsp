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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script>
// This example displays an address form, using the autocomplete feature
// of the Google Places API to help users fill in the information.

var placeSearch, autocomplete;
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function initialize() {
  // Create the autocomplete object, restricting the search
  // to geographical location types.
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      { types: ['geocode'] });
  // When the user selects an address from the dropdown,
  // populate the address fields in the form.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    fillInAddress();
  });
}

// [START region_fillform]
function fillInAddress() {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

  for (var component in componentForm) {
    document.getElementById(component).value = '';
    document.getElementById(component).disabled = false;
  }

  // Get each component of the address from the place details
  // and fill the corresponding field on the form.
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}
// [END region_fillform]

// [START region_geolocation]
// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = new google.maps.LatLng(
          position.coords.latitude, position.coords.longitude);
      autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
          geolocation));
    });
  }
}
// [END region_geolocation]

    </script>

</head>
<body onload="initialize()">

	<%@ include file="header.jsp" %> 
	<!-- Start Site Container -->
    
    <div class="container make-bg">

	 
    <div class="row-fluid">
            	<div class="span6">
                <form action="">
               
               
<div id="locationField">
  Country/State/City:<input id="autocomplete" placeholder="City,State,Country"
             onFocus="geolocate()" type="text"></input><br />
    </div>
   <table id="address">
      <tr>
        <td class="label">Street address</td>
        <td class="slimField"><input class="field" id="street_number"
              disabled="true"></input></td>
              <td class="label">Road No</td>
        <td class="wideField" colspan="2"><input class="field" id="route"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">City</td>
        <td class="wideField" colspan="3"><input class="field" id="locality"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">State</td>
        <td class="slimField"><input class="field"
              id="administrative_area_level_1" disabled="true"></input></td>
        <td class="label">Zip code</td>
        <td class="wideField"><input class="field" id="postal_code"
              disabled="true"></input></td>
      </tr>
      <tr>
        <td class="label">Country</td>
        <td class="wideField" colspan="3"><input class="field"
              id="country" disabled="true"></input></td>
      </tr>
    </table>
Land Marks:<textarea id="landmark" ></textarea>
<input type="hidden" id="shopid" value="" />
<input type="button" id="submitshopkeeperaddress" value="submit"/>
</div>
                </form>
               <div id="insertioncompleted"></div>
                </div>
            	<div class="span6"></div>
            	
            </div>
	</div>
    
	<%@ include file="footer.jsp" %> 
<script>
$(document).ready(function(){
$("#submitshopkeeperaddress").click(function(event){
	  event.preventDefault();
	  
	  street_number=$("#street_number").val();
	  route = $("#route").val();
	   locality = $("#locality").val();
	   administrative_area_level_1 = $("#administrative_area_level_1").val();
	   postal_code = $("#postal_code").val();
	   country = $("#country").val();
	   landmark = $("#landmark").val();
	  // alert(address);
	 $.post("ShopKeeperAddressController",
	{
		 street_number : street_number,
		 route: route,
		 locality :locality,
		 administrative_area_level_1: administrative_area_level_1,
		 postal_code :postal_code,
		 country: country,
		 landmark :landmark,
		 
	}
	,function(data,status){
		
		var shopid =data.trim().split(":::");
		$("#insertioncompleted").empty().append(shopid[0]);
		$("#shopid").val(shopid[1]);
		});
  });
});
</script>
</body></html>