package soft.script;

//wrapper for iris class yippee

import crowplexus.iris.Iris;
import crowplexus.iris.IrisConfig;
import openfl.display.BitmapData;
import openfl.utils.ByteArray;
import openfl.media.Sound;
import sys.io.File;


class HScript 
{
    public var path:String = '';
    public var parentFolder:String = '';
    public var script:String = 'hscript';
    public var iris:Iris = null;

    public function new(script:String, path:String='scripts')
    {
        this.path = '${script}.hx';
        this.parentFolder = path;
        this.script = script;

        reload();
    }

    public function call(func:String, ?vars:Array<Dynamic> = null):Dynamic
    {
        if (!iris.exists(func)) return null;
        var finalVars:Array<Dynamic> = vars;
        if (finalVars == null) finalVars = new Array();
        return iris.call(func, finalVars);
    }

    inline public function get(name:String)
        return iris.get(name);

    inline public function set(name:String, value:Dynamic, allowOverride:Bool = true)
    {
        iris.set(name, value, allowOverride);
    }

    inline public function execute()
        iris.execute();


    public function reload()
    {
        var rules:RawIrisConfig = {name: script + '.hx', autoRun: false, autoPreset: true};
        iris = new Iris(Paths.getText(path, parentFolder), rules);
        
        DefaultLibrary.implement(this);
        AssetLibrary.implement(this);
    }
}