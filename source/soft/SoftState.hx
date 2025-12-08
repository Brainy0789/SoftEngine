package soft;

import soft.script.HScript;

class SoftState extends FlxState 
{
    var state:String = 'SoftState';

    var hscript:HScript;

    var globals:Array<HScript> = new Array();

    override public function new(state:String)
    {
        Sys.println('In state: ' + state);
        this.state = state;
        hscript = new HScript(state, 'states');
        hscript.set("game", this);

        populateGlobals();

        super();

        //hscript.call('create'); //test thing
    }

    public function call(func:String, vars:Array<Dynamic> = null)
    {
        var finalVars:Array<Dynamic> = vars;
        if (finalVars == null) finalVars = new Array();

        for (script in globals)
        {
            script.call(func, finalVars);
        }

        return hscript.call(func, finalVars);
    }

    override public function create()
    {
        call('create');
        super.create();
    }

    override public function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.F5) reload();
        call('update', [elapsed]);
        super.update(elapsed);
    }

    public function reload()
    {
        SoftG.switchState(state);
    }

    private function populateGlobals()
    {
        globals = new Array();

        var globalsString:Array<String> = Paths.getFilesFromDir('scripts/', 'hx');

        for (script in globalsString)
        {
            globals.push(new HScript(script));
        }
    }
}
