import flixel.text.FlxText;

function create()
{
    trace('Hello, world!!');

    var text = new FlxText(0, 0, 'Hello, world!!', 32);
    text.screenCenter();
    game.add(text);
}