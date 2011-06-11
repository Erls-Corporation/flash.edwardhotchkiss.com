
/*

	Events.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.Events = function (options) {

    	if (this.length == 0) { 
        	settings.ErrorHandler(); 
    	};

		var Element = $(this);

    	var settings = {
    		BindUnbnd : "bind",
    		DefaultEventType : "click",
        	CallbackHandler : function () {},
        	OnBeforeHandler : function () {},
        	ErrorHandler : function () { Error(); }
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

   	 	settings.OnBeforeHandler();

		function Error() {
			alert("Please provide event arguments.");
		}

		function CreateEvent(EventType, EventNameSpace) {
			return this.bind(EventType + EventNameSpace, function() {
				$(this).addClass(EventNameSpace);
			});
		}

		function RemoveEvent(EventType, EventNameSpace) {
			return this.removeClass(EventNameSpace).unbind(EventType + EventNameSpace);
		}

	}

}) (jQuery);
