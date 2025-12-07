package soft.backend;

import soft.backend.Meta;

class EntryState extends FlxState
{
    override public function new()
    {
        super();
        var meta = new Metadata();
        SoftState.switchState(meta.data.entryState);
    }
}