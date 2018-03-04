phantom.injectJs("../cookie.js");

var args = require("system").args;
var page = require('webpage').create();

var url = args[1];

page.open(url, function () {   
    	
	setTimeout(function() {

		var source = page.content;
		
		var img1 = source.split('pbk-page" src="')[1];
		var img2 = img1.split('"')[0];
		
		console.log(img2);

    		phantom.exit();

	}, 5000);

});
