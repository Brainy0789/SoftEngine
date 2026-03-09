package soft.script.implements;

class DefaultLibrary implements IHScriptImplement
{
    public static function _include(script:String)
    {
        set(script, new HScript(script));
        get(script).execute();
    }

    public static function _createScript(script:String, path:String = 'scripts/')
        return new HScript(script, path);

    public static function implement(hscript:HScript)
    {
        hscript.set('FlxG', FlxG);
        hscript.set('SoftG', SoftG);
        hscript.set('createScript', _createScript);
        hscript.set('include', _include);
        hscript.set('FlxSave', SoftSave);
        hscript.set('SoftSave', SoftSave);
        hscript.set('string', Std.string);
        hscript.set('int', Std.int);
        hscript.set('float', Std.float);
        hscript.set('this', hscript);
    }
}