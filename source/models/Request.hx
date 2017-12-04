package models;
import models.GridEntity.TypeOfObject;

class Request{

    public var requestType:RequestType;
    public var itemTypeRequested:TypeOfObject;

    public function new(requestTypeparam:RequestType){
        requestType = requestTypeparam;
        itemTypeRequested = getItemTypeToFullfillRequest(requestType);

    }
    
    private function getItemTypeToFullfillRequest(requestType:RequestType):TypeOfObject{
        switch (requestType){
            case RequestType.Coffee:
				return TypeOfObject.Coffee;
            case RequestType.Copies:
				return TypeOfObject.COPIES;
            default:
        }
            
    }
}

enum RequestType{
    Coffee;
    Copies;
}