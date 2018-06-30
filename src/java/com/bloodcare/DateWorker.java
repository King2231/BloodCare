/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare;
import java.util.*;
/**
 *
 * @author aditi bobhate
 */
public class DateWorker 
{
    public static String getCurrentDate()
    {
        Calendar cal=Calendar.getInstance();
        int m=cal.get(Calendar.MONTH)+1;
        int y=cal.get(Calendar.YEAR);
        int d=cal.get(Calendar.DATE);
        String date=""+y+"-"+m+"-"+d;
        return date;
        
    }
    public static String convertToSql(String date)
    {
        System.out.println("B4: "+date);
        String[] dates=date.split("-");
        String std=dates[2]+"-"+dates[1]+"-"+dates[0];
       System.out.println("After: "+std);
        return std;
    }
    public static String convertToStandard(String date)
    {
      System.out.println("B4: "+date);
         String[] dates=date.split("-");
        String std=dates[2]+"-"+dates[1]+"-"+dates[0];
        System.out.println("After: "+std);
        return std;  
    }
    public static String convertTopattern(String date)
    {
      System.out.println("B4: "+date);
         String[] dates=date.split("-");
        String std=dates[0]+dates[1]+dates[2];
        System.out.println("After: "+std);
        return std;  
    }
}
