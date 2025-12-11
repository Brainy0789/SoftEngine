package soft;

class SoftG
{
    public static function switchState(state:String)
    {
        FlxG.switchState(new SoftState(state));
    }

    public static function createSprite(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Null<FlxGraphicAsset>):FlxSprite 
        return new FlxSprite(X, Y, SimpleGraphic);
}