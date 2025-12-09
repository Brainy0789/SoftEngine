package;

import flixel.FlxGame;
import openfl.display.Sprite;
import soft.backend.EntryState;
import LauncherState;

import flixel.util.FlxTimer;
class Main extends Sprite
{
	public function new()
	{
		Paths.CUR_GAME = 'test';
		super();

		#if USE_LAUNCHER
		addChild(new FlxGame(0, 0, LauncherState, 60, 60, false));
		#else
		addChild(new FlxGame(0, 0, EntryState, 60, 60, false));
		#end
	}
}
