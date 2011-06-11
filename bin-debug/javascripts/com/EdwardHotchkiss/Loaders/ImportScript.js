
/*

	ImportScripts.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.Import = function(options) {
	
    	if (options.length < 1) { 
    		alert("Please Specify Options!");
        	return false; 
    	};

    	var settings = {
    		Script   : null,
    		Message  : null,
    		Logging  : true,
			Scripts  : "javascripts/",
    		onBefore : function(){},
			onAfter  : function(){}
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

		var scriptLoaded = false;

		function comify(Script) {
			return settings.Scripts + Script.replace(/\./g, "/") + ".js";
		};
		
		settings.onBefore.apply(this);

		$.ajax({
			type     : 'GET',
			url      : comify(settings.Script),
			dataType : 'script',
			cache    : true,
			success  : function() {
				if (console.log && settings.Logging == true) {
					if (settings.Message != null) {
						msg = settings.Message;
					} else {
						msg = "Script: " + comify(settings.Script) + " Loaded";
					}
					console.log(msg);	
				}
				settings.onAfter.apply(this);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				if (console.log && settings.Logging == true) {
					console.log(errorThrown);
				}
			} 
		});

	};

})(jQuery);

/*

EXAMPLE USAGE WITH FULL OPTIONS:

<script type="text/javascript" src="javascripts/com/jQuery/Core/jQuery.js"></script>
<script type="text/javascript" src="javascripts/com/EdwardHotchkiss/Loaders/ImportScript.js"></script>
<script type="text/javascript">
	$.Import({
    	Script   : "com.EdwardHotchkiss.Events.Events",
    	Message  : "LOADED!",
   		onBefore : function() { alert("onBefore Function Call Executing"); },
    	onAfter  : function() { alert("onAfter Function Call Executing"); },
    	Scripts  : "js/"
    });
</script>

EXAMPLE USAGE WITH MINIMAL OPTIONS:

$.Import({Script:"com.EdwardHotchkiss.Events.Events"});

*/