package defs;
import models.Point;

/**
 * @author Dave
 */
typedef LevelDef =
{
	var levelID:Int;
	var levelName:String;
	var quota:Int;
	var happinessRequirement:Float;
	var managerCount:Int;
	
	//Request times.  A request is generated at least every requestMin seconds.
	//At maximum requestMin + requestVar seconds.
	var requestMin:Float;
	var requestVar:Float;
	
	var playerStart:Point;
}