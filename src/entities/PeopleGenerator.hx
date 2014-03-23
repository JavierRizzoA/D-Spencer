package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;

class PeopleGenerator extends Entity {

	private var timeSincePerson:Float;

	public function new(x:Float, y:Float) {
		super(x, y);
		timeSincePerson = 0;

	}

	private function generatePeople() {
		var posX:Int = 0;
		var posY:Int = 0;
		switch(Std.random(4)) {
			case 0:
				posX = Std.random(HXP.width);
				posY = -64;
				HXP.scene.add(new Person(posX, posY));
			case 1:
				posX = HXP.width + 32;
				posY = Std.random(HXP.height);
				HXP.scene.add(new Person(posX, posY));
			case 2:
				posX = Std.random(HXP.height);
				posY = HXP.height + 64;
				HXP.scene.add(new Person(posX, posY));
			case 3:
				posX = -32;
				posY = Std.random(HXP.height);
				HXP.scene.add(new Person(posX, posY));
		}
	}

	public override function update() {
		timeSincePerson += HXP.elapsed;
		super.update();
		if(Std.random(300) == 0) {
			generatePeople();
			timeSincePerson = 0;
		}
		if(timeSincePerson >= 3) {
			generatePeople();
			timeSincePerson = 0;
		}
	}

}