package models;
import models.GridEntity.TypeOfObject;

class Request{

    public var requestType:RequestType;
    public var itemTypeRequested:TypeOfObject;
    public var itemTypeCreated:MoveableObject;

    public function new(requestTypeparam:RequestType){
        requestType = requestTypeparam;
        itemTypeRequested = getItemTypeRequested(requestType);
    }
    
    /**
     *  use this to set up a new request by "mapping" the request type to the object requested enums
     *  
     *  @param   requestType 
     *  @return  TypeOfObject
     */
    private function getObjectTypeRequested(requestType:RequestType):TypeOfObject{
        var typeOfObject:TypeOfObject;
        switch (requestType){
            case RequestType.Coffee:
            typeOfObject = TypeOfObject.Coffee;
            case RequestType.Copies:
            typeOfObject = TypeOfObject.Copies;
            default: typeOfObject = TypeOfObject.None;
        }
        return typeOfObject;
    }
    
    /**
     *  use to get the type of item that should be created by the new request
     *  such as a document to copy that the manager will need to hold
     *  
     *  @param   requestType 
     *  @return  TypeOfObject
     */
    public function getObjectTypeCreated(requestType:RequestType):TypeOfObject{
        var typeOfObject:TypeOfObject;
        switch (requestType){
            case RequestType.Copies:
                typeOfObject = TypeOfObject.DOCTOCOPY;
            default: typeOfObject = TypeOfObject.None;
        }
        return typeOfObject;
    }
}

enum RequestType{
    None;
    Coffee;
    Copies;
}