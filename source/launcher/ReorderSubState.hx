package launcher;

import flixel.util.FlxColor;

class ReorderSubState extends FlxSubState
{
    var text:FlxText = new FlxText();

    override public function create()
    {
        var black = new FlxSprite();
        black.makeGraphic(1, 1, FlxColor.BLACK);
        black.scale.set(FlxG.width, FlxG.height);
        black.screenCenter();

        text.setFormat('assets/fonts/vcr.ttf', 32);
        add(text);

        add(black);
    }

    override public function update(elapsed:Float)
    {
        var back = (FlxG.keys.justPressed.ESCAPE);

        if (back) 
        {
            closeSubState();
            destroy();
        }

        for (item in Order.get_order())
        {
            text.text += item + '\n';
        }
    }
}