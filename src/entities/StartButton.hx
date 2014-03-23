package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

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
				HXP.scene = new scenes.GameScene();
			}
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}

}