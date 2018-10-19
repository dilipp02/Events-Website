/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

/**
 *
 * @author dilip
 */
public class LoginData {
    private String email;
    private String Password;
    private String name;
    private String category;
    private int u_id;
    private String surname;
    private String contact;
    private String dob;
    private String gender;

    public LoginData()
    {       }

    public LoginData(int u_id, String name, String surname, String gender, String email, String Password, String contact, String dob, String category) {
        this.name = name;
        this.email = email;
        this.Password = Password;
        this.category = category;
        this.u_id = u_id;
        this.surname = surname;
        this.contact = contact;
        this.dob = dob;
        this.gender = gender;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
    
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
    
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
