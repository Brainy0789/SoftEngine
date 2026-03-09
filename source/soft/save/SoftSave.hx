package soft.save;

import flixel.util.FlxSave;

class SoftSave 
{
    public var save:FlxSave;
    public var data(get, set):Dynamic;

    public function get_data():Dynamic
        return save.data;

    public function set_data(v:Dynamic):Dynamic
    {
        //save.data = v;
        return v;
    }

    public var name:String = 'save';

    public function new(saveName:String = 'save')
    {
        name = saveName;

        save = new FlxSave();
        save.bind(Paths.CUR_GAME + '/' + name);
    }

    public function bind()
    {
        Sys.println('Not supported.');
    }

    inline public function flush()
    {
        save.flush();
    }
}