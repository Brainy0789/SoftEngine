package soft;

import soft.script.HScript;

class SoftState extends FlxState 
{
    var state:String = 'SoftState';

    var hscript:HScript;

    var globals:Map<String, HScript>;

    override public function new(state:String)
    {
        Sys.println('In state: ' + state);
        this.state = state;
        hscript = new HScript(state, 'states');
        hscript.set("game", this);

        super();

        //hscript.call('create'); //test thing
    }

    override public function create()
    {
        hscript.call('create');
        super.create();
    }

    override public function update(elapsed:Float)
    {
        hscript.call('update', [elapsed]);
        super.update(elapsed);
    }
}
