
/*

	Positioning.js
	version 0.1
	MIT / (More accurately - X11 License)
	First Created: 10/27/2000
	Last Revised: 07/29/2008
	http://www.edwardhotchkiss.com
	edward@edwardhotchkiss.com

*/

(function($) {

	$.fn.AbsoluteActual = function (options) {

    	var settings = {
    		cropContainer : null,
			IntTopMost  : 10000,
			IntLeftMost : 10000,
			IntBottomMost : 0,
			IntRightMost : 0,
			ElementCount : 0,
			gridBeginningIntTop : 0,
			gridBeginningIntLeft : 0
    	};

    	if (options) {
        	jQuery.extend(settings, options);
   	 	};

		var Element = $(this);

		function CalcDimensions() {
			$("#container .dragElement").each(function() {
				IntLeft = getIntLeftMostPos($(this));
				IntTop = getIntTopMostPos($(this));
				settings.IntLeftMost = (IntLeft < settings.IntLeftMost) ? IntLeft : settings.IntLeftMost;
				settings.IntTopMost = (IntTop < settings.IntTopMost) ? IntTop : settings.IntTopMost;
			});
			settings.IntLeftMost -= 20;
			settings.IntTopMost -= 10;
		}

		function CalcContainer() {
			$("#container .dragElement").each(function() {
				IntRight = getIntLeftMostPos($(this)) + $(this).width();
				IntBottom = getIntTopMostPos($(this)) + $(this).height();
				settings.IntRightMost = (IntRight > settings.IntRightMost) ? IntRight : settings.IntRightMost;
				settings.IntBottomMost = (IntBottom > settings.IntBottomMost) ? IntBottom : settings.IntBottomMost;
			});
			settings.IntRightMost += 20;
		}

		function getIntLeftMostPos(Element) {
			return parseInt($(Element).css("left"));
		}

		function getIntTopMostPos(Element) {
			return parseInt($(Element).css("top"));
		}

		function Condense() {
			var x = 0;
			$("body .dragElement").each(function() {
				IntLeft = getIntLeftMostPos($(this));
				IntTop = getIntTopMostPos($(this));
				newIntLeft = IntLeft - settings.IntLeftMost;
				newIntTop = IntTop - settings.IntTopMost + 15;
				$(this).css("left", newIntLeft);
				$(this).css("top", newIntTop);
				x += 1;
			});
		}
		
		function CropContainer() {
			newWidth = settings.IntRightMost;
			newHeight = settings.IntBottomMost + 30;
			$("#container").css("width", newWidth);
			$("#container").css("height", newHeight);
			$("#insertZone").css("width", newWidth);
			$("#insertZone").css("height", newHeight);
			$("#embedInputHolder").css("width", newWidth);
			$("#embedInputHolder").css("height", newHeight+60);
			$("body").css("width", newWidth);
			$("html").css("width", newWidth);
		}

		CalcDimensions();
		Condense();

		if (settings.cropContainer == 1) {
			CalcContainer();
			CropContainer();
		}

	}
	
}) (jQuery);