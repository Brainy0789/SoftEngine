package soft.script;

import openfl.utils.ByteArray;
import openfl.media.Sound;
import sys.io.File;

class AssetManager
{
    static var images:Map<String, BitmapData> = new Map();
    static var sounds:Map<String, Sound> = new Map();

    static public function _loadImage(path:String, key:String)
    {
        images.set(key, imageFromPath(path));
    }             
    
    static public function _getAsset(path:String, parentFolder:String = '')
    {
        return Paths.getGamePath(path, 'assets/' + parentFolder);
    }

    static public function _getAudio(key:String, folder:String = "sounds"):Sound
    {
        var bytes = File.getBytes(_getAsset(key + ".ogg", folder));
        
        var sound = new Sound();
        sound.loadCompressedDataFromByteArray(ByteArray.fromBytes(bytes), bytes.length);
        
        return sound;
    }

    static public function _getSound(key:String)
    {
        return _getAudio(key);
    }

    static public function _getMusic(key:String)
    {
        return _getAudio(key, 'music');
    }

    static public function imageFromPath(key:String)
    {
        var bytes = File.getBytes(_getAsset(key + '.png', 'images'));
        return BitmapData.fromBytes(ByteArray.fromBytes(bytes));
    }
}
