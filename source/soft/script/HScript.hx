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


    public function _getAsset(path:String, parentFolder:String = '')
    {
        return Paths.getGamePath(path, 'assets/' + parentFolder);
    }

    public function _getAudio(key:String, folder:String = "sounds"):Sound
    {
        var bytes = File.getBytes(_getAsset(key + ".ogg", folder));
        
        var sound = new Sound();
        sound.loadCompressedDataFromByteArray(ByteArray.fromBytes(bytes), bytes.length);
        
        return sound;
    }

    public function _getSound(key:String)
    {
        return _getAudio(key);
    }

    public function _getMusic(key:String)
    {
        return _getAudio(key, 'music');
    }

    public function _getImage(key:String)
    {
        var bytes = File.getBytes(_getAsset(key + '.png', 'images'));
        return BitmapData.fromBytes(ByteArray.fromBytes(bytes));
    }

    public function _include(script:String)
    {
        set(script, new HScript(script));
        get(script).execute();
    }

    public function _createScript(script:String, path:String = 'scripts/')
        return new HScript(script, path);

    public function reload()
    {
        var rules:RawIrisConfig = {name: script + '.hx', autoRun: false, autoPreset: true};
        iris = new Iris(Paths.getText(path, parentFolder), rules);

        //now exposed variables go here
        set('FlxG', FlxG);
        set('SoftG', SoftG);
        set('getAsset', _getAsset);
        set('getImage', _getImage);
        set('getSound', _getSound);
        set('getMusic', _getMusic);
        set('include', _include);
        set('createScript', _createScript);

        set('this', this);
    }
}