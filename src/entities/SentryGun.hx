package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;

class SentryGun extends Entity {

	public static var h:Int = 128;
	public static var w:Int = 128;

	private var image:Image;
	private var angle:Float;

	public function new(x:Float, y:Float) {
		super(x, y);
		setHitbox(w, h, 64, 64);
		image = new Image("graphics/entities/sentry_gun.png");
		graphic = image;
		image.centerOrigin();
		type = "sentry";
	}

	private function handleInput() {
		if(Input.mousePressed) {
			createFood();
		}
	}

	private function createFood() {
		HXP.scene.add(new FoodProjectile(x, y, angle));
	}

	private function rotate() {
		if(Input.mouseX >= this.x) {
			angle = Math.asin((this.y - Input.mouseY)/Math.sqrt((Math.pow(this.y - Input.mouseY,2))+(Math.pow(this.x - Input.mouseX,2)))) * 57.2957795;
		}
		else	{
			angle = -Math.asin((this.y - Input.mouseY)/Math.sqrt((Math.pow(this.y - Input.mouseY,2))+(Math.pow(this.x - Input.mouseX,2)))) * 57.2957795 + 180;
		}
		image.angle = angle;
	}

	private function checkCollision() {

	}

	public override function update() {
		handleInput();
		rotate();
		checkCollision();
		super.update();
	}

}