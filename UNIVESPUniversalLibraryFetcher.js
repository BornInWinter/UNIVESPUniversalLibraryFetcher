phantom.cookiesEnabled;

phantom.injectJs('header.js');

var args = require('system').args;
var page = require('webpage').create();

var libr = args[1];
var user = args[2];
var pass = args[3];
var link = args[4];

setLibrary(libr, user, pass);
