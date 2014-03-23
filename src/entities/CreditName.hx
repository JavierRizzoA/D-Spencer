package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class CreditName extends Entity {
	private var image:Image;
	public function new(x:Float, y:Float, name:String) {
		super(x, y);
		image = new Text(name, {color: 0xFFFFFF, size: 32, align: flash.text.TextFormatAlign.CENTER});
		image.centerOrigin();
		graphic = image;
		setHitbox(image.width, image.height);
	}

	public override function update() {
		while(x < HXP.halfWidth) {
			moveAtAngle(0, 1);
		}
		super.update();
	}
}