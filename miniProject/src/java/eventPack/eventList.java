/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eventPack;

import db.DBController;
import java.util.ArrayList;

/**
 *
 * @author dilip
 */
public class eventList {
    private ArrayList<NewEventData> eventList = new ArrayList<NewEventData>();

    public eventList() {
        DBController objdb = new DBController();
        eventList = objdb.getAllEvents();
    }
    
    public ArrayList<NewEventData> getEventList() {
        return eventList;
    }

}
