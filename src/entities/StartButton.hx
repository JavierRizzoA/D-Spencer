package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class StartButton extends Entity {

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		image = new Image("graphics/gui/start_button.png");
		graphic = image;
		setHitbox(275, 55);
	}

	private function handleInput() {
		if(collidePoint(x, y, Input.mouseX, Input.mouseY)) {
			if(Input.mousePressed) {
				new com.haxepunk.Sfx("audio/click.mp3").play();
				if(cast(HXP.scene, scenes.MainMenu).bgmusic1.playing) {
					cast(HXP.scene, scenes.MainMenu).bgmusic1.stop();
				} else if(cast(HXP.scene, scenes.MainMenu).bgmusic2.playing) {
					cast(HXP.scene, scenes.MainMenu).bgmusic2.stop();
				}

				HXP.scene = new scenes.InstructionsScene();
			}
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}

}