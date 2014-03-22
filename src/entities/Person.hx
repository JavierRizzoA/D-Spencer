package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class Person extends Entity {

	private var image:Image;
	private var angle:Float;

	public function new(x:Float, y:Float) {
		super(x, y);
		angle = getAngle();
		image = Image.createRect(32, 64, 0x00FF00);
		image.centerOrigin();
		graphic = image;
		setHitbox(32, 64, 16, 32);

	}

	private function getAngle():Float {
		var centerX = HXP.halfWidth;
		var centerY = HXP.halfHeight;
		var angle:Float = 0;

		if(x > centerX && y < centerY) {
			angle = Math.atan((Math.abs(centerY - y)) / (Math.abs(x - centerX))) * 57.2957795;
		}
		if(x < centerX && y < centerY) {
			angle = Math.atan((Math.abs(x - centerX)) / (Math.abs(centerY - y))) * 57.2957795 + 90;
		}
		if(x < centerX && y > centerY) {
			angle = Math.atan((Math.abs(centerY - y)) / (Math.abs(x - centerX))) * 57.2957795 + 180;
		}
		if(x > centerX && y > centerY) {
			angle = Math.atan((Math.abs(x - centerX)) / (Math.abs(centerY - y))) * 57.2957795 + 270;
		}
		angle += 180;
		angle %= 360;

		return angle;
	}

	private function checkCollision() {
		var e:Entity = null;
		e = collide("projectile", x, y);
		if(e != null) {
			cast(e, entities.FoodProjectile).destroy();
			destroy();
		}
		e = null;
		e = collide("sentry", x, y);
		if(e != null) {
			destroy();
		}

	}

	public function destroy() {
		HXP.scene.remove(this);
	}



	public override function update() {
		moveAtAngle(angle, 2);
		checkCollision();
		super.update();
	}
}