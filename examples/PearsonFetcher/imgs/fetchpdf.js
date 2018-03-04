phantom.injectJs("../cookie.js");

var args = require("system").args;
var page = require('webpage').create();

var url = args[1] + '/pages/' + args[2];
var page = require('webpage').create();

page.open(url, function() {   
    	
	setTimeout(function() {

		var source = page.content;

		var img1 = source.split('Img" src="')[1];
		var img2 = source.split('Img" src="')[2];

		if (typeof img2 == 'undefined') {

			console.log(img1.split('"')[0]);

		} else {

			console.log(img1.split('"')[0] + " " + img2.split('"')[0]);

		}

 		phantom.exit();

	}, 10000);

});
