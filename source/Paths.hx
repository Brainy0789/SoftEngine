package;

import soft.backend.Meta;
import haxe.Json;
import sys.io.File;
import sys.FileSystem;
class Paths
{
    public static var CUR_GAME:String = '';
    public static function getGamePath(dir:String, parentFolder:String = '')
    {
        if (parentFolder != '') parentFolder += '/';

        var path = 'games/${CUR_GAME}/${parentFolder}${dir}';
        Sys.println(path);
        return path;
    }

    public inline static function getMeta():Meta
        try {
            return Json.parse(getText('meta.json'));
        } catch (e:Dynamic)
        {
            Sys.println('Error getting meta.json!!');
            return null;
        }

    public static function getText(path:String, parentFolder:String = ''):String
    {
        var string:String = '';

        var fullPath = getGamePath(path, parentFolder);

        try {
            string = File.getContent(fullPath);
        } catch (e:Dynamic)
        {
            Sys.println('Error getting text from path: ${fullPath}!');
        }

        return string;
    }

    public static function getFilesFromDir(dir:String, ext:String, parentFolder:String = ''):Array<String>
    {
        dir = getGamePath(dir, parentFolder);
        var files = new Array<String>();
        
        try
        {
            for (file in FileSystem.readDirectory(dir))
            {
                if (!FileSystem.isDirectory(dir + "/" + file) && file.endsWith(ext))
                {
                    files.push(file.substring(0, file.lastIndexOf('.' + ext)));
                }
            }
        }
        catch (e:Dynamic)
        {
            trace("Error reading directory: " + dir);
        }
        
        return files;
    }
}