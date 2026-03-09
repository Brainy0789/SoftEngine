package soft.script.implements;

class AssetLibrary implements IHScriptImplement
{
    public static function _getAsset(path:String, parentFolder:String = '')
    {
        return Paths.getGamePath(path, 'assets/' + parentFolder);
    }

    public static function _getAudio(key:String, folder:String = "sounds"):Sound
    {
        var bytes = File.getBytes(_getAsset(key + ".ogg", folder));
        
        var sound = new Sound();
        sound.loadCompressedDataFromByteArray(ByteArray.fromBytes(bytes), bytes.length);
        
        return sound;
    }

    public static function _getSound(key:String)
    {
        return _getAudio(key);
    }

    public static function _getMusic(key:String)
    {
        return _getAudio(key, 'music');
    }

    public static function _getImage(key:String)
    {
        var bytes = File.getBytes(_getAsset(key + '.png', 'images'));
        return BitmapData.fromBytes(ByteArray.fromBytes(bytes));
    }

    public static function implement(hscript:HScript)
    {
        hscript.set('getAsset', _getAsset);
        hscript.set('getImage', _getImage);
        hscript.set('getSound', _getSound);
        hscript.set('getMusic', _getMusic);
    }
}