package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class SentryGun extends Entity {

	public static var h:Int = 130;
	public static var w:Int = 500;

	private var image:Image;

	public function new(x:Float, y:Float) {
		super(x, y);
		setHitbox(w, h, 130, 500);
		image = new Image("graphics/entities/start_button.png");
		graphic = image;
		image.centerOrigin();
	}

	private function handleInput() {
		if(Input.mousePressed) {
			if (( Math.abs(this.x - Input.mouseX) <= 65 ) && ( Math.abs(this.y - Input.mouseY) <= 250 )) {
			HXP.scene = new scenes.MainMenu();
			{
		}
	}

	public override function update() {
		handleInput();
		super.update();
	}

}