package;

import soft.backend.EntryState;
import soft.backend.Meta;

class LauncherState extends FlxState
{
    var games:Array<String> = new Array();
    var metas:Map<String, Metadata> = new Map();

    var placeholderText:FlxText;
    var controlText:FlxText;

    var curSelected:Int = 0;

    private function setPlaceholderText()
    {
        if (!metas.exists(Paths.CUR_GAME)) return;
        var meta = metas.get(Paths.CUR_GAME);

        var name:String = 'No Name';
        var desc:String = 'No Description';
        var author:String = 'Unknown';

        if (meta.data.name != null) name = meta.data.name;
        if (meta.data.description != null) desc = meta.data.description;
        if (meta.data.author != null) author = meta.data.author;

        var text = 'Title: ${name}\nDescription: ${desc}\nCreated by ${author}\n\n${curSelected + 1}/${games.length}';

        placeholderText.text = text;
    }

    override public function create()
    {
        super.create();

        games = Paths.getFolders('', '', 'games/');

        for (game in games)
        {
            Paths.CUR_GAME = game;
            metas.set(game, new Metadata());
        }

        placeholderText = new FlxText(0, 64, "");
        placeholderText.setFormat('assets/fonts/vcr.ttf', 32);

        controlText = new FlxText(0, FlxG.height - 64, "Arrow keys/WASD to scroll, space or enter to enter game, R to reload list.");
        controlText.setFormat('assets/fonts/vcr.ttf', 16);
        
        add(placeholderText);   
        add(controlText); 

        changeSelection();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        var left = (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A);
        var right = (FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.D);
        var accept = (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE);
        var back = (FlxG.keys.justPressed.ESCAPE);
        var rel = (FlxG.keys.justPressed.R);

        if (left) changeSelection(-1);
        if (right) changeSelection(1);
        if (accept) FlxG.switchState(new EntryState());
        if (back) Sys.exit(0);
        if (rel) reload();
    }

    public function changeSelection(change:Int = 0)
    {
        curSelected += change;
        if (curSelected < 0) curSelected = games.length - 1;
        if (curSelected > games.length - 1) curSelected = 0;
        Paths.CUR_GAME = games[curSelected];
        setPlaceholderText();
    }

    public function reload()
    {
        FlxG.switchState(new LauncherState());
    }

}