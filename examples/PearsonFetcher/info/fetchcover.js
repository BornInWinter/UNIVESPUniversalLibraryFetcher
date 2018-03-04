phantom.injectJs("../cookie.js");

var args = require("system").args;
var page = require('webpage').create();

var url = args[1];
var page = require('webpage').create();

page.open(url, function () {
	
	setTimeout(function() {

		var first = page.url.split('/')[7];

		if (typeof first == 'undefined') {

			console.log("404");
			phantom.exit();

		}

		console.log(first);
  		phantom.exit();

	}, 10000);

});
