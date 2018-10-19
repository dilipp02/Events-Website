/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ValidationPack;
/**
 *
 * @author dilip
 */
public class Validation
{
    public boolean contactValidator(String data)
    {
        if(data.length()!=10)
        {
            return false;
        }
        for(int i=0 ; i<data.length() ; i++)
        {
            if(!(data.charAt(i)>=48 && data.charAt(i)<=57))
                return false;
        }
        return true;
    }
    public boolean usernameValidator(String data)
    {
        if(data.length()<5)
        {
            return false;
        }
        if(data.charAt(0)<65 || (data.charAt(0)>90 && data.charAt(0)<97) || data.charAt(0)>122)
        {
            return false;
        }
        for(int i=1 ; i<data.length() ; i++)
        {
            if(data.charAt(i)!=45 && data.charAt(i)!=46 && !(data.charAt(i)>=48 && data.charAt(i)<=57) && !(data.charAt(i)>=65 && data.charAt(i)<=90) && data.charAt(i)!=95 && !(data.charAt(i)>=97 && data.charAt(i)<=122))
                return false;
        }
        return true;
    }
    public boolean dateValidator(String data)
    {
        if(data.length()!=10)
        {
            return false;
        }
        if(data.charAt(2)!=data.charAt(5))
        {
            return false;
        }
        if(!(data.charAt(2)>=45 && data.charAt(2)<=47) && data.charAt(2)!=95)
        {
            return false;
        }
        for(int i=0 ; i<data.length() ; i++)
        {
            if(i==2 || i==5)
            {
                continue;
            }
            if(!(data.charAt(i)>=48 && data.charAt(i)<=57))
            {
                return false;
            }
        }
        return true;
    }
    public boolean mailValidator(String data)
    {
        int i,j;
        int len = data.length();
        if(len==0)
            return false;
        for(i=1 ; i!=len-1; i++)
        {
            if(data.charAt(i)==64)
            {
                break;
            }
        }
        if(data.charAt(i)==data.charAt(len-1))
            return false;
        String sub = data.substring(0, i);
        boolean status = usernameValidator(sub);
        if(status==false)
        {
            return false;
        }
        int cnt=0;
        for(j=i+1 ; j<len-4 ; j++)
        {
            if(!(data.charAt(j)>=48 && data.charAt(j)<=57) && !(data.charAt(j)>=65 && data.charAt(j)<=90) && !(data.charAt(j)>=97 && data.charAt(j)<=122))
            {
                return false;
            }
            if(cnt==10)
            {
                return false;
            }
            cnt++;
        }
        if(cnt<5)
        {
            return false;
        }
        String x = ".com";
        sub = data.substring(len-4, len);
        if(x.equals(sub)==false)
        {
            return false;
        }
        return true;
    }
    public boolean password1Validator(String data)
    {
        int a=0,s=0,n=0;
        if(data.length()<5)
        {
            return false;
        }
        for(int i=0 ; i<data.length() ; i++)
        {
            if((data.charAt(i)>=65 && data.charAt(i)<=90) || (data.charAt(i)>=97 && data.charAt(i)<=122))
            {
                a=1;
            }
            else if(data.charAt(i)>=48 && data.charAt(i)<=57)
            {
                n=1;
            }
            else if(data.charAt(i)==43 || (data.charAt(i)>=45 && data.charAt(i)<=47) || data.charAt(i)==64 || data.charAt(i)==92 || data.charAt(i)==95)
            {
                s=1;
            }
            else
            {
                return false;
            }
        }
        int sum=a+n+s;
        if(sum==3)
        {
            System.out.print("Strong, ");
        }
        else if(sum==2)
        {
            System.out.print("Medium, ");
        }
        else
        {
            System.out.print("Weak, ");
        }
        return true;
    }
    
    public boolean timeValidator(String data)
    {
        data.trim();
        int len = data.length()-1;
        if(data.charAt(len)!=77 || (data.charAt(len-1)!=65 && data.charAt(len-1)!=80) || data.charAt(2)!=58)
        {
            return false;
        }
        for (int i = 0; i < 5; i++) 
        {
            if((data.charAt(i)<48 || data.charAt(i)>57) && i!=2)
                return false;
        }
        int hour = Integer.parseInt(data.substring(0, 2));
        int min = Integer.parseInt(data.substring(3, 5));
        if(hour>12 || min>59)
            return false;
        return true;
    }
    
    public boolean feesValidator(String data)
    {
        for (int i = 0; i < data.length(); i++) {
            if(data.charAt(i)<48 || data.charAt(i)>57)
                return false;
        }
        return true;
    }
    
    public boolean nameValidator(String data)
    {
        if(data.length()<1)
            return false;
        for (int i = 0; i < data.length(); i++) {
            if(data.charAt(i)<65 || data.charAt(i)>122 || (data.charAt(i)>90 && data.charAt(i)<97))
                return false;
        }
        return true;
    }
    
    public boolean eventNameValidator(String data)
    {
        if(data.length()<1)
            return false;
        for (int i = 0; i < data.length(); i++) {
            if(data.charAt(i)==32)
                continue;
            if(data.charAt(i)<65 || data.charAt(i)>122 || (data.charAt(i)>90 && data.charAt(i)<97))
                return false;
        }
        return true;
    }
}
