/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import Login.LoginData;
import UserPack.UserList;
import eventPack.NewEventData;
import eventPack.OrganiserEventData;
import eventPack.UserEventData;
import java.util.ArrayList;
import java.sql.*;
import updatedEvents.updatedEventData;
/**
 *
 * @author dilip
 */
public class DBController {
    Connection objConnection = null;
    Statement objStatement = null;
    PreparedStatement objPreparedStatement = null;
    ResultSet rs = null;
    void init()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            objConnection = DriverManager.getConnection("jdbc:mysql://localhost/project?"+"user=root&password=root");
            objStatement = objConnection.createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    public ArrayList<LoginData> getAllUsers()
    {
        ArrayList<LoginData> list = new ArrayList<LoginData>();
        init();
        try
        {
            rs = objStatement.executeQuery("select * from users");
            while(rs.next())
            {
                list.add(new LoginData(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
        return list;
    }
    public void insertUser(String name, String surname, String gender, String email, String password, String pno, String dob, String category)
    {
        init();
        UserList obju = new UserList();
        ArrayList<LoginData> users = obju.getUserList();
        int i = users.size();
        i++;
        try
        {
            objPreparedStatement = objConnection.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            objPreparedStatement.setInt(1, i);
            objPreparedStatement.setString(2, name);
            objPreparedStatement.setString(3, surname);
            objPreparedStatement.setString(4, gender);
            objPreparedStatement.setString(5, email);
            objPreparedStatement.setString(6, password);
            objPreparedStatement.setString(7, pno);
            objPreparedStatement.setString(8, dob);
            objPreparedStatement.setString(9, category);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public ArrayList<NewEventData> getAllEvents()
    {
        ArrayList<NewEventData> eventList = new ArrayList<NewEventData>();
        init();
        try
        {
            rs = objStatement.executeQuery("select * from competition");
            while(rs.next())
            {
                eventList.add(new NewEventData(rs.getInt(7), rs.getString(1), rs.getString(6), rs.getString(2), rs.getString(5), rs.getString(4), rs.getInt(8), rs.getString(3)));
            }
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
        return eventList;
    }
    public void insertEvent(String name, String desc, String time, String date, String college, String category, int fees)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("insert into competition values(?, ?, ?, ?, ?, ?, ?, ?)");
            objPreparedStatement.setString(1, name);
            objPreparedStatement.setString(2, category);
            objPreparedStatement.setString(3, desc);
            objPreparedStatement.setString(4, time);
            objPreparedStatement.setString(5, date);
            objPreparedStatement.setString(6, college);
            objPreparedStatement.setNull(7, Types.INTEGER);
            objPreparedStatement.setInt(8, fees);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public void enrollEvent(int u_id, int e_id)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("insert into enrolled values(?, ?)");
            objPreparedStatement.setInt(1, u_id);
            objPreparedStatement.setInt(2, e_id);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public ArrayList<UserEventData> getUserEvents()
    {
        ArrayList<UserEventData> eventList = new ArrayList<UserEventData>();
        init();
        try
        {
            rs = objStatement.executeQuery("select * from enrolled");
            while(rs.next())
            {
                eventList.add(new UserEventData(rs.getInt(1), rs.getInt(2)));
            }
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
        return eventList;
    }
    public void insertOrganiserEvent(int u_id, int e_id)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("insert into organiserEvents values(?, ?)");
            objPreparedStatement.setInt(1, u_id);
            objPreparedStatement.setInt(2, e_id);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public ArrayList<OrganiserEventData> getOrganiserEvents()
    {
        ArrayList<OrganiserEventData> eventList = new ArrayList<OrganiserEventData>();
        init();
        try
        {
            rs = objStatement.executeQuery("select * from organiserEvents");
            while(rs.next())
            {
                eventList.add(new OrganiserEventData(rs.getInt(1), rs.getInt(2)));
            }
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
        return eventList;
    }
    public void updateEvent(int e_id, String name, String date, String time, int fees, String desc)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("update competition set name = ?, desp = ?, time = ?, date = ?, fees = ? where comp_id = ?");
            objPreparedStatement.setString(1, name);
            objPreparedStatement.setString(2, desc);
            objPreparedStatement.setString(3, time);
            objPreparedStatement.setString(4, date);
            objPreparedStatement.setInt(5, fees);
            objPreparedStatement.setInt(6, e_id);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public void deleteEvent(int e_id)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("delete from competition where comp_id = ?");
            objPreparedStatement.setInt(1, e_id);
            objPreparedStatement.executeUpdate();
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public void deleteEventUser(int e_id)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("delete from enrolled where comp_id = ?");
            objPreparedStatement.setInt(1, e_id);
            objPreparedStatement.executeUpdate();
            System.out.println("Hello");
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public void deleteAdminEvent(int e_id)
    {
        init();
        try
        {
            objPreparedStatement = objConnection.prepareStatement("delete from organiserevents where comp_id = ?");
            objPreparedStatement.setInt(1, e_id);
            objPreparedStatement.executeUpdate();
            System.out.println("Hello");
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
    }
    public ArrayList<updatedEventData> getUpdatedEvents()
    {
        ArrayList<updatedEventData> eventList = new ArrayList<updatedEventData>();
        init();
        try
        {
            rs = objStatement.executeQuery("select * from updated");
            while(rs.next())
            {
                eventList.add(new updatedEventData(rs.getInt(1), rs.getString(2), rs.getString(14), rs.getString(11), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(10), rs.getString(8)));
            }
        }
        catch(Exception e)
        {   e.printStackTrace(); }
        finally
        {
            try
            {
                if(rs!=null)
                    rs.close();
                if(objStatement!=null)
                    objStatement.close();
                if(objPreparedStatement!=null)
                    objPreparedStatement.close();
                if(objConnection!=null)
                    objConnection.close();
            }
            catch(SQLException se)
            {   se.printStackTrace();   }
        }
        return eventList;
    }
}
