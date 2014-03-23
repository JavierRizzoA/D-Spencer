package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class MuteButton extends Entity {

	public static var h:Int = 30;
	public static var w:Int = 30;

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		image = new Image("graphics/entities/mute_button.png");
		graphic = image;
		image.centerOrigin();
		setHitbox(w, h, 15, 15);

	}

	private function handleInput() {
		if(collidePoint(x, y, Input.mouseX, Input.mouseY)) {
			if(Input.mousePressed) {
				mute();
			}
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}

}