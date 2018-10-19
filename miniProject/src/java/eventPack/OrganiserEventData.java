/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eventPack;

/**
 *
 * @author dilip
 */
public class OrganiserEventData {
    private int u_id;
    private int e_id;

    public OrganiserEventData() {
    }

    public OrganiserEventData(int u_id, int e_id) {
        this.u_id = u_id;
        this.e_id = e_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }
}
