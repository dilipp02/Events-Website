/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eventPack;
/**
 *
 * @author dilip
 */
public class NewEventData {
    private String Name;
    private String eventCollege;
    private String eventCategory;
    private String date;
    private String time;
    private String description;
    private String fees;
    private int fee;
    private int e_id;

    public NewEventData() {
    }
    
    public NewEventData(int e_id, String Name, String eventCollege, String eventCategory, String date, String time, int fee, String description) {
        this.Name = Name;
        this.eventCollege = eventCollege;
        this.eventCategory = eventCategory;
        this.date = date;
        this.time = time;
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
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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
}
