package;

import sof.backend.Meta;
import haxe.Json;
import sys.io.File;
class Paths
{
    public static var CUR_GAME:String = '';
    public inline static function getGamePath(dir:String)
        return 'games/${CUR_GAME}/${dir}';


    public inline static function getMeta():Meta
        try {
            return Json.parse(File.getContent(getGamePath('meta.json')));
        } catch (e:Dynamic)
        {
            Sys.println('Error getting meta.json!!');
            return null;
        }
}