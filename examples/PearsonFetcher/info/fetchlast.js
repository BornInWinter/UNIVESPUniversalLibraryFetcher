phantom.injectJs("../cookie.js");

var args = require("system").args;
var page = require('webpage').create();

var url = args[1] + '/pages/' + args[2];
var page = require('webpage').create();

page.open(url, function () {   
    	
	setTimeout(function() {
		
		console.log(page.url.split('/')[7]);
    		phantom.exit();

	}, 8000);

});
