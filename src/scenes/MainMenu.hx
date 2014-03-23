package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;
import com.haxepunk.HXP;

class MainMenu extends Scene {
	public var startButton:entities.StartButton;
	private var background:Image;
	public var bgmusic1:Sfx;
	public var bgmusic2:Sfx;
	private var timeAcum:Float;
	private var startedbg2:Bool;


	public override function begin() {
		background = new Image("graphics/backgrounds/mainmenubg.png");
		addGraphic(background);
		bgmusic1 = new Sfx("audio/menubg1.mp3");
		bgmusic2 = new Sfx("audio/menubg2.mp3");
		bgmusic1.play();
		startedbg2 = false;
		timeAcum = 0;
		add(new entities.MuteButton(750, 0));
		add(new entities.StartButton(510, 210));
		add(new entities.CreditsButton(510, 310));
	}

	public function startBg2() {
		if(!startedbg2 && timeAcum >= bgmusic1.length) {
			bgmusic2.loop();
			startedbg2 = true;
		}
	}

	public override function update() {
		timeAcum += HXP.elapsed;
		startBg2();
		super.update();
	}


}