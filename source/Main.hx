package;

import flixel.FlxGame;
import openfl.display.Sprite;
import soft.backend.EntryState;

import flixel.util.FlxTimer;
class Main extends Sprite
{
	public function new()
	{
		super();

		#if USE_LAUNCHER
		addChild(new FlxGame(0, 0, launcher.LauncherState, 60, 60, false));
		#else
		addChild(new FlxGame(0, 0, EntryState, 60, 60, false));
		#end
	}
}
