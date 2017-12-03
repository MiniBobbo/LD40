package models;
import models.Manager;

class CEO extends Manager{

    public function new(){
        super(ManagerType.CEO);
        title = "CEO";
    }

}