package soft.backend;

import soft.backend.Meta;
import soft.backend.WindowUtil;
import openfl.Lib;
class EntryState extends FlxState
{
    override public function create()
    {
        var meta = new Metadata();
        if (meta.data.windowName != null) Lib.current.stage.window.title = meta.data.windowName;
        if (meta.data.windowSize != null) WindowUtil.setWindowSize(meta.data.windowSize.width, meta.data.windowSize.height, meta.data.windowSize.width, meta.data.windowSize.height);
        Sys.println('Switching state to: ' + meta.data.entryState);
        SoftG.switchState(meta.data.entryState);
    }
}