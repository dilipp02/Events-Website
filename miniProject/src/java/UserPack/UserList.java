/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package UserPack;

import Login.LoginData;
import db.DBController;
import java.util.ArrayList;

/**
 *
 * @author dilip
 */
public class UserList {
    private ArrayList<LoginData> userList;

    public UserList() {
        DBController objdb = new DBController();
        userList = objdb.getAllUsers();
    }

    public ArrayList<LoginData> getUserList() {
        return userList;
    }

//    public void setUserList(ArrayList<LoginModelProject> userList) {
//        this.userList = userList;
//    }
    
}

