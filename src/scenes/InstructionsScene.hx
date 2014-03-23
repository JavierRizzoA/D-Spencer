package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;

class InstructionsScene extends Scene {
	public override function begin() {
		addGraphic(new Image("graphics/backgrounds/instructionsbg.png"));
		add(new entities.PlayButton(540, 400));
	}
}