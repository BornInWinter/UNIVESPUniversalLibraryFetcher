phantom.injectJs("../cookie.js");

var args = require("system").args;
var page = require('webpage').create();

var url = args[1];

page.viewportSize = {
	width: 1600,
	height: 2259
};

page.clipRect = {
    	top: 0,
    	left: 0,
  	width: 1600,
    	height: 2259
};

page.open(url, function() {

	page.render('book/' + args[2] + '.jpg');
	phantom.exit();

});
