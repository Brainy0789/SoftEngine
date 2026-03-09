package soft;

import flixel.text.FlxText;

class SoftG
{
    public static function switchState(state:String)
    {
        FlxG.switchState(new SoftState(state));
    }

    public static function setText(text:FlxText, v:String)
        text.text = v;
}