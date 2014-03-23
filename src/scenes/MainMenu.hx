package scenes;

import com.haxepunk.Scene;

class MainMenu extends Scene {
	public var startButton:entities.StartButton;

	public override function begin() {

		add(new entities.StartButton(250, 65));
		add(new entities.StartButton(500, 0));
	}


}