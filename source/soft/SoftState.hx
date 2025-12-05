package soft;

import soft.script.HScript;

class SoftState extends FlxState 
{
    var state:String = 'SoftState';

    var hscript:HScript;

    public static function switchState(state:String)
    {
        FlxG.switchState(new SoftState(state));
    }

    override public function new(state:String)
    {
        super();

        this.state = state;
        hscript = new HScript(Paths.getGamePath('states/${state}.hx'));
    }
}
