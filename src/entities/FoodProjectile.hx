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
		image = Image.createRect(32, 32, 0xFFFFFF);
		image.centerOrigin();
		graphic = image;
		type = "projectile";
		setHitbox(32, 32, 16, 16);
	}

	public function destroy() {
		HXP.scene.remove(this);
	}

	public function checkBounds() {
		if(x + width < 0) {
			destroy();
		} else if(x - width > HXP.width) {
			destroy();
		} else if(y + height < 0) {
			destroy();
		} else if(y - height > HXP.height) {
			destroy();
		}
	}

	public override function update() {
		moveAtAngle(angle, 5);
		checkBounds();
		super.update();
	}
}