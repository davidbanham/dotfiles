$(function () {

	var names = new Array();
	var favicons = new Array();

	names.push("Online Interactive Marketing Mail");
	favicons.push("http://oiminc.com.au/favicon.ico");
	names.push("Crnr Mail");
	favicons.push("http://crnr.com.au/crnrfavicon.png");
	names.push("Pinion Mail");
	favicons.push("http://pinion.gg/pinionlogo.png");

	var splitTitle = document.title.split(" - ");

	var link = document.createElement('link');
	link.setAttribute('rel', 'shortcut icon');

	for ( i in names ) {

		if ( splitTitle == names[i] ) {
			link.setAttribute('href', favicons[i]);
			$('head').append(link);
		};
	};

});
