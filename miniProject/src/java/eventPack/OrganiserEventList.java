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
public class OrganiserEventList {
    private ArrayList<OrganiserEventData> eventList = new ArrayList<OrganiserEventData>();

    public OrganiserEventList() {
        DBController objdb = new DBController();
        eventList = objdb.getOrganiserEvents();
    }
    
    public ArrayList<OrganiserEventData> getEventList() {
        return eventList;
    }
}
