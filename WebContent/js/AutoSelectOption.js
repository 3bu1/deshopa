$(document).ready(function() {
    var menOptions = '<option>--</option><option id="Clothing" value="Clothing" >Clothing</option><option id="Accessories" value="Accessories" >Accessories</option><option id="Footwear" value="Footwear" >Footwear</option><option id="Watches" value="Watches" >Watches</option><option id="Sunglasses" value="Sunglasses" >Sunglasses</option><option id="Bags" value="Bags" >Bags</option><option id="Belts" value="Belts">Belts</option><option id="Wallets" value="Wallets" >Wallets</option><option id="Fragrances" value="Fragrances" >Fragrances</option><option id="Jewellery" value="Jewellery" >Jewellery</option>';
    
var womenOptions = '<option>--</option><option id="Clothing" value="Clothing" >Clothing</option><option id="Accessories" value="Accessories" >Accessories</option><option id="Footwear" value="Footwear" >Footwear</option><option id="Watches" value="Watches" >Watches</option><option id="Sunglasses" value="Sunglasses" >Sunglasses</option><option id="Bags" value="Bags" >Bags</option><option id="Belts" value="Belts" >Belts</option><option id="Wallets" value="Wallets" >Wallets</option><option id="Fragrances" value="Fragrances" >Fragrances</option><option id="Grooming_Wellness" value="Grooming_Wellness" >Grooming and Wellness</option><option id="Clutches" value="Clutches" >Clutches</option><option id="Jewellery" value="Jewellery" >Jewellery</option>';

var Kids ='<option>--</option><option id="Baby_Care" value="BabyCare" catg="KIDS">Baby Care</option><option id="Infant_Clothing" value="InfantsClothing" catg="KIDS">Infants Clothing</option><option id="Boys_Clothing" value="BoysClothing" catg="KIDS">Boys Clothing</option><option id="Girls_Clothing" value="GirlsClothing" catg="KIDS">Girls Clothing</option><option id="Toys_Games" value="Toys_Games " catg="KIDS">Toys & Games</option>';

var HOMEFURNITURE ='<option>--</option><option id="Furnishing_home" value="HomeFurnishing" catg="HOMEFURNITURE">Home Furnishing</option><option id="Dining_Kitchen" value="Kitchen_Dining" catg="HOMEFURNITURE">Kitchen & Dining</option><option id="Appliances_Home" value="HomeAppliances" catg="HOMEFURNITURE">Home Appliances</option><option id="Furniture_fur" value="Furniture" catg="HOMEFURNITURE">Furniture</option>';

var BOOKSMEDIA ='<option>--</option><option id="Books" value="Books" catg="BOOKSMEDIA">Books</option><option id="eBooks" value="eBooks" catg="BOOKSMEDIA">eBooks</option><option id="Music" value="Music" catg="BOOKSMEDIA">Music</option><option id="Movies_TVShows" value="Movies_TVShows" catg="BOOKSMEDIA">Movies & TV Shows</option><option id="Stationery" value="Stationery" catg="BOOKSMEDIA">Stationery</option><option id="Posters" value="Posters" catg="BOOKSMEDIA">Posters</option>';

var ELECTRONICS ='<option>--</option><option id="Software" value="Software" catg="ELECTRONICS">Software</option><option id="Gaming_Consoles" value="Gaming_Consoles" catg="ELECTRONICS">Gaming & Consoles</option><option id="Audio_Video" value="Audio_Video" catg="ELECTRONICS">Audio & Video</option><option id="Cameras" value="Cameras" catg="ELECTRONICS">Cameras</option><option id="Computer_Accessories" value="ComputerAccessories" catg="ELECTRONICS">Computer Accessories</option><option id="Mobiles_Accessories" value="MobilesAccessories" catg="ELECTRONICS">Mobiles Accessories</option><option id="Tablets" value="Tablets" catg="ELECTRONICS">Tablets</option><option id="Laptops" value="Laptops" catg="ELECTRONICS">Laptops</option><option id="Mobiles" value="Mobiles" catg="ELECTRONICS">Mobiles</option>';
    
$("#category").change(function () {
			var xyz = $("option:selected").val();
			$("#subcategory").empty();
	if(xyz=="Men"){
			
		$("#subcategory").append(menOptions);
	}
	else if(xyz=="Women"){
		$("#subcategory").append(womenOptions);
		}
	else if(xyz=="Kids"){
		$("#subcategory").append(Kids);
	}
	else if(xyz=="HOME_FURNITURE"){
		$("#subcategory").append(HOMEFURNITURE);
	}
	else if(xyz=="BOOKS_MEDIA"){
		$("#subcategory").append(BOOKSMEDIA);
	}
	else if(xyz=="ELECTRONICS"){
		$("#subcategory").append(ELECTRONICS);
	}
	
});

});