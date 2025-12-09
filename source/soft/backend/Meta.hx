package soft.backend;

typedef WindowSize = {
    var width:Int;
    var height:Int;
}

typedef Meta = {
    @:optional var name:String; //name shown in launcher
    @:optional var description:String; //description shown in launcher
    @:optional var windowName:String; //defaults to game name
    @:optional var windowSize:WindowSize; //Window Size in game, can be changed in code of course.
    @:optional var version:String;
    @:optional var launcherVersion:String;
    @:optional var author:String;
    @:optional var startFullscreen:Bool;
    var entryState:String;
}

class Metadata
{
    public var data:Meta = null;

    public function new()
    {
        data = Paths.getMeta();
    }
}