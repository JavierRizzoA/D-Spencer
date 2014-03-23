package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;

class CreditsScene extends Scene {
	private var sound:Sfx;

	public override function begin() {
		addGraphic(new Image("graphics/backgrounds/creditsbg.png"));
		sound = new Sfx("audio/credits.mp3");
		sound.loop();
	}

	public override function update() {
		if(Input.mousePressed) {
			sound.stop();
			HXP.scene = new scenes.MainMenu();
		}
		super.update();
	}
}