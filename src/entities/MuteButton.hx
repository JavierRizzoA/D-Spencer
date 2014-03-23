package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class MuteButton extends Entity {

	private var imageSound:Image;
	private var imageMute:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		imageSound = new Image("graphics/gui/sound.png");
		imageMute = new Image("graphics/gui/mute.png");
		graphic = imageSound;
		setHitbox(50, 50);
	}

	private function handleInput() {
		if(collidePoint(x, y, Input.mouseX, Input.mouseY)) {
			if(Input.mousePressed) {
				if(!Main.isMute) {
					Main.isMute = true;
					HXP.volume = 0;
				} else {
					Main.isMute = false;
					HXP.volume = 1;
				}
			}
		}
	}

	private function handleAnimation() {
		if(Main.isMute) {
			graphic = imageMute;
		} else {
			graphic = imageSound;
		}
	}

	public override function update() {
		handleInput();
		handleAnimation();
		super.update();
	}

}