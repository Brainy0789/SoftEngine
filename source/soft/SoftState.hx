package soft;

import soft.script.HScript;

class SoftState extends FlxState 
{
    var state:String = 'SoftState';

    var hscript:HScript;

    var globals:Array<HScript> = new Array();
    //var includes:Array<HScript> = new Array();
    //var includeIndex:Int = 0;

    //exposed functions yeah
    public function _include(script:String)
    {
        //includes.push(new HScript(script));
        //includes[includeIndex].execute();
        hscript.set(script, new HScript(script));
        hscript.get(script).execute();
        //includeIndex++;
    }

    public function _openSubState(substate:String)
    {
        openSubState(new SoftSubState(substate, this));
    }

    override public function new(state:String)
    {
        Sys.println('In state: ' + state);
        this.state = state;
        hscript = new HScript(state, 'states');

        //exposed variables
        hscript.set("openSubState", _openSubState);
        hscript.set('include', _include);

        //multiple ways to access the state itself
        hscript.set("game", this);
        hscript.set("this", this);
        hscript.set("state", this);
        hscript.execute();

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

        var globalsString:Array<String> = Paths.getFilesFromDir('globals/', 'hx');

        var i = 0;
        for (script in globalsString)
        {
            globals.push(new HScript(script, 'globals'));
            globals[i].execute();
            i++;
        }
    }
}
