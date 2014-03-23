package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;

class CreditsScene extends Scene {
	private var name:entities.CreditName;
	private var sentry:entities.SentryGun;
	public override function begin() {
		name = new entities.CreditName(-100, 50, "Javier Rizzo (Eddonarth)");
		sentry = new entities.SentryGun(HXP.halfWidth, HXP.halfHeight);
		//sentry.classic = true;
		//add(sentry);
		add(name);
	}
}