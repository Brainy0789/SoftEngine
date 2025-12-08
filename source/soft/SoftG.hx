package soft;

class SoftG
{
    public static function switchState(state:String)
    {
        FlxG.switchState(new SoftState(state));
    }
}