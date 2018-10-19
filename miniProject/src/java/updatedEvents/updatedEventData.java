/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package updatedEvents;

/**
 *
 * @author dilip
 */
public class updatedEventData {
    private String Name;
    private String eventCollege;
    private String eventCategory;
    private String newdate;
    private String olddate;
    private String newtime;
    private String oldtime;
    private String description;
    private String fees;
    private int fee;
    private int e_id;

    public updatedEventData() {
    }
    
    public updatedEventData(int e_id, String Name, String eventCollege, String eventCategory, String olddate, String newdate, String oldtime, String newtime, int fee, String description) {
        this.Name = Name;
        this.eventCollege = eventCollege;
        this.eventCategory = eventCategory;
        this.olddate = olddate;
        this.oldtime = oldtime;
        this.newdate = newdate;
        this.newtime = newtime;
        this.fee = fee;
        this.description = description;
        this.e_id = e_id;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEventCollege() {
        return eventCollege;
    }

    public void setEventCollege(String eventCollege) {
        this.eventCollege = eventCollege;
    }

    public String getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }

    public String getDate() {
        return newdate;
    }

    public void setDate(String newdate) {
        this.newdate = newdate;
    }

    public String getTime() {
        return newtime;
    }

    public void setTime(String newtime) {
        this.newtime = newtime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getFees() {
        return fees;
    }

    public void setFees(String fees) {
        this.fees = fees;
    }
    
    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getOlddate() {
        return olddate;
    }

    public void setOlddate(String olddate) {
        this.olddate = olddate;
    }

    public String getOldtime() {
        return oldtime;
    }

    public void setOldtime(String oldtime) {
        this.oldtime = oldtime;
    }
}
