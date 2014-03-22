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
		if(Input.mouseX > this.x && Input.mouseY < this.y) {
			angle = Math.atan((Math.abs(y - Input.mouseY)) / (Math.abs(Input.mouseX - x))) * 57.2957795;
		}
		if(Input.mouseX < this.x && Input.mouseY < this.y) {
			angle = Math.atan((Math.abs(Input.mouseX - x)) / (Math.abs(y - Input.mouseY))) * 57.2957795 + 90;
		}
		if(Input.mouseX < this.x && Input.mouseY > this.y) {
			angle = Math.atan((Math.abs(y - Input.mouseY)) / (Math.abs(Input.mouseX - x))) * 57.2957795 + 180;
		}
		if(Input.mouseX > this.x && Input.mouseY > this.y) {
			angle = Math.atan((Math.abs(Input.mouseX - x)) / (Math.abs(y - Input.mouseY))) * 57.2957795 + 270;
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