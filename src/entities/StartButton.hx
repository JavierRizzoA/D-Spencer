package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class StartButton extends Entity {

	public static var h:Int = 130;
	public static var w:Int = 500;

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		image = new Image("graphics/entities/start_button.png");
		graphic = image;
		image.centerOrigin();
		setHitbox(w, h, 250, 65);

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