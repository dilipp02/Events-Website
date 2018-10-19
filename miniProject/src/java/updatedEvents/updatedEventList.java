/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package updatedEvents;

import db.DBController;
import java.util.ArrayList;

/**
 *
 * @author dilip
 */
public class updatedEventList {
    private ArrayList<updatedEventData> eventList = new ArrayList<updatedEventData>();

    public updatedEventList() {
        DBController objdb = new DBController();
        eventList = objdb.getUpdatedEvents();
    }
    
    public ArrayList<updatedEventData> getEventList() {
        return eventList;
    }
}
