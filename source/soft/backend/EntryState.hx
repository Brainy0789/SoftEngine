package soft.backend;

import soft.backend.Meta;

class EntryState extends FlxState
{
    override public function create()
    {
        var meta = new Metadata();
        Sys.println('Switching state to: ' + meta.data.entryState);
        SoftG.switchState(meta.data.entryState);
    }
}