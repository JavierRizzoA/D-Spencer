package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

class CreditsButton extends Entity {

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		image = new Image("graphics/gui/credits_button.png");
		graphic = image;
		setHitbox(278, 55);

	}

	private function handleInput() {
		if(collidePoint(x, y, Input.mouseX, Input.mouseY)) {
			if(Input.mousePressed) {
				new com.haxepunk.Sfx("audio/click.mp3").play();
				//HXP.scene = new scenes.CreditsScene();
			}
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}

}