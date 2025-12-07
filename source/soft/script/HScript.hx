package soft.script;

class HScript 
{
    public var path:String = '';
    public var iris:Iris = null;

    public function new(path:String)
    {
        this.path = path;
    }

    public function call(func:String, ?vars:Array<Dynamic> = [])
    {

    }
}