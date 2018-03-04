function isLogged(title) {

	return title == "Digite seu usuário e senha" || title == "Enter your username and password" ? false : true;

}

function login(user, pass) {

	page.evaluate(function(u, p) {

		document.getElementById('username').value = u;
		document.getElementById('password').value = p;

		document.getElementById('regularsubmit').click();
	
	}, user, pass);

}


function setLibrary(lib, usr, psw) {

	switch(lib) {

		case 'pearson' :
	
			page.open('https://login.univesp.br/simplesaml/module.php/core/pearson.php', function() {
		
				if (!isLogged(page.title)) { 
				
					login(usr, psw); 
			
					setTimeout(function() {
			
						isLogged(page.title) ? console.log('Logged!') : phantom.exit(2);
													
					}, 5000);

				} else {

					console.log('Logged!');

				}
		
			});

			break;

		case 'mylib' :
		
			page.open('https://login.univesp.br/simplesaml/module.php/core/mb.php', function() {
		
				if (!isLogged(page.title)) { 
				
					login(usr, psw); 
			
					setTimeout(function() {
							
						isLogged(page.title) ? console.log('Logged!') : phantom.exit(2);
								
					}, 5000);

				} else {

					console.log('Logged!');

				}
	
			});

			break;

		case 'evolution' :

			page.open('https://login.univesp.br', function() {

				page.evaluate(function() {
			
					document.getElementsByTagName('a')[5].click();
			
				});

				setTimeout(function() {

					page.evaluate(function() {
			
						document.getElementsByClassName('btn-blue')[0].click();
		
					});

					setTimeout(function() {

						page.evaluate(function() {
			
							document.getElementsByClassName('btn-blue')[0].click();
		
						});

						setTimeout(function() {
			
							if (!isLogged(page.title)) { 
							
								login(usr, psw);

								setTimeout(function() {
							
									isLogged(page.title) ? console.log('Logged!') : phantom.exit(2);		

								}, 10000);
						
							} else {

								console.log('Logged!');

							}
					
						}, 5000);

					}, 5000);
				
				}, 5000);

			});

			break;

		default :
			phantom.exit(1);

	}

}
