package soft.backend;

//from my fnf mod lol -brainy7890

class WindowUtil
{
    public static function setWindowSize(windowWidth:Int, windowHeight:Int, gameWidth:Int = 1280, gameHeight:Int = 720)
    {
        lime.app.Application.current.window.resize(windowWidth, windowHeight);

        FlxG.resizeGame(gameWidth, gameHeight);
    }
}
