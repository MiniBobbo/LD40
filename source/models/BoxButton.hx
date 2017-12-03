package models;
import models.GridEntity.Facing;
import models.GridEntity.TypeOfObject;

/**
 * ...
 * @author Dave
 */
class BoxButton extends GridEntity 
{

	public function new() 
	{
		super();
		facing = Facing.Down;
		type = TypeOfObject.Box_Button;
	}
	
}