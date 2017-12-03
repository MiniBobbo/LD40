package models;

import models.GridEntity.TypeOfObject;

/**
 * ...
 * @author Dave
 */
class CoffeeObject extends MoveableObject 
{

	public function new() 
	{
		super(TypeOfObject.Coffee);
	}
	
}