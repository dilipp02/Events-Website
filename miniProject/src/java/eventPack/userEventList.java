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
public class userEventList {
    private ArrayList<UserEventData> eventList = new ArrayList<UserEventData>();

    public userEventList() {
        DBController objdb = new DBController();
        eventList = objdb.getUserEvents();
    }
    
    public ArrayList<UserEventData> getEventList() {
        return eventList;
    }

}
