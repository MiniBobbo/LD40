package models;

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
            TypeOfObject.Coffee;
            case RequestType.Copies:
            TypeOfObect.Copies;
            default:
        }
            
    }
}

enum RequestType{
    Coffee;
    Copies;
}