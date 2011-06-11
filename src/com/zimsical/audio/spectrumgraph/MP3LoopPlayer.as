
package com.zimsical.audio.spectrumgraph
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
    public class MP3LoopPlayer extends Sprite {
    	
		private var sound:Sound;
        private var channel:SoundChannel;
        private var playing:Boolean = false;
        private var playPauseButton:Sprite;
        private var position:int = 0;
        private var spectrumGraph:SpectrumGraph;
        private var volumeControl:VolumeControl;
        
        public function MP3LoopPlayer(stageWidth:Number, stageHeight:Number):void
        {
            var timer:Timer = new Timer(60);
            timer.addEventListener(TimerEvent.TIMER, onTimer);
            timer.start();
            playing = true;
            sound = new Sound(new URLRequest("./assets/audio/LemonLoop.mp3"));
            spectrumGraph = new SpectrumGraph();
            spectrumGraph.x = 10;
            spectrumGraph.y = 33;
            addChild(spectrumGraph);
            spectrumGraph.addEventListener(MouseEvent.CLICK, onPlayPause);
            volumeControl = new VolumeControl();
            volumeControl.buttonMode = true;
            volumeControl.addEventListener(Event.CHANGE, onTransform);
            channel = sound.play();
            channel.addEventListener(Event.SOUND_COMPLETE, PlayMusic);
            spectrumGraph.x = stageWidth - spectrumGraph.width - 140;
            spectrumGraph.y = stageHeight - spectrumGraph.height - 120;
            this.visible = false;
        }

		public function PlayMusic(evt:Event):void {
			channel = sound.play();
			channel.addEventListener(Event.SOUND_COMPLETE, PlayMusic);
		}
        
        public function onTransform(event:Event):void {
            channel.soundTransform = new SoundTransform(volumeControl.volume);
        }
        
        public function onPlayPause(event:MouseEvent):void {
            if (playing) {
                position = channel.position;
                channel.stop();
            } else {
                channel = sound.play(position);
            }
            playing = !playing;
        }
        
        public function onTimer(event:TimerEvent):void {
            var loaded:int = sound.bytesLoaded;
            var total:int = sound.bytesTotal;
            var length:int = sound.length;
            var position:int = channel.position;
            if (total > 0) {
                var percentBuffered:Number = loaded / total;
                spectrumGraph.update();
            }
        }
    }    
}