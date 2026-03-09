package launcher.backend;

import sys.io.File;
import sys.FileSystem;

/**
    Class to manage the ordering of games.
**/

class Order
{
    public static var order(get, set):Array<String>;

    public static function get_order():Array<String>
    {
        if (FileSystem.exists('list.txt'))
        {
            return File.getContent('list.txt').split('\n');
        }
        else
        {
            order = new Array();
            return new Array();
        }
    }

    public static function set_order(v:Array<String>)
    {
        File.saveContent("list.txt", v.join("\n"));
        return v;
    }
}