
package com.zimsical.audio.spectrumgraph {

	import flash.display.Sprite;
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;

	public class SpectrumGraph extends Sprite {
	
    	private var spectrumHolder:Sprite = new Sprite;
    	
    	public function SpectrumGraph() {
        	//addChild(spectrumHolder);
    	}

    	public function update():void {
        	/*var spectrum:ByteArray = new ByteArray();
        	SoundMixer.computeSpectrum(spectrum);
        	for (var i:int = 1; i < 10; i++) {
        		var bar:Sprite = new Sprite;
        		var barWidth:Number = 10;
        		var barHeight:Number = 10 + spectrum.readFloat() * 10;
        		var barX:int = i * 10 + 2;
        		var barY:int = barHeight;
        		bar.graphics.beginFill(0xFFFFFF);
        		bar.graphics.drawRect(barX, barY, barWidth, barHeight);
        		bar.graphics.endFill();
        		spectrumHolder.addChild(bar);
        	}*/
    	}

	}
}