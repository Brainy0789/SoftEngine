package soft;

class SoftSubState extends FlxSubState
{
    var substate:String = 'SoftSubstate';
    var hscript:HScript;

    override public function new(substate:String, parent:SoftState)
    {
        super();
        this.substate = substate;
        hscript = new HScript(substate, 'substates');
        hscript.set("substate", this);
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