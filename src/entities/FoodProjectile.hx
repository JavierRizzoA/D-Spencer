package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class FoodProjectile extends Entity {
	private var angle:Float;
	private var image:Image;
	public function new(x:Float, y:Float, a:Float) {
		super(x, y);
		angle = a;
		image = Image.createRect(16, 16, 0xFFFFFF);
		image.centerOrigin();
		graphic = image;
		type = "projectile";
		setHitbox(16, 16, 8, 8);
	}

	public function destroy() {
		HXP.scene.remove(this);
	}

	public override function update() {
		moveAtAngle(angle, 5);
		super.update();
	}
}