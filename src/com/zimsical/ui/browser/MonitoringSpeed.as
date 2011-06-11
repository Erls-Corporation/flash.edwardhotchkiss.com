
package com.zimsical.ui.browser
{
	
	public class MonitoringSpeed
	{
		
		import flash.system.System;
		
		public function MonitoringSpeed() 
		{
		
			var memoryUsage:Number = Math.floor(System.totalMemory / (1024 * 1024) * 100) / 100;
			trace("Memory Usage: " + memoryUsage + " MB");
			
		}

	}
	
}
