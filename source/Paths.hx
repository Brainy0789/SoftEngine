package;

class Paths
{
    public static var CUR_GAME:String = '';
    public inline static function getGamePath(dir:String)
        return 'games/${CUR_GAME}/${dir}';
}