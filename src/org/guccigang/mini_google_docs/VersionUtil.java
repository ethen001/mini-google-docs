
/*
This is a utility class for version control
 */
package org.guccigang.mini_google_docs;
import java.util.*;
public class VersionUtil
{
    /**This function takes in two strings and returns the list of differences.
     *
     * @param str1
     * @param str2
     * @return result
     */
    public static String getChanges(String str1, String str2)
    {
        String result = "";
        ArrayList<String> list1 = new ArrayList<>();
        ArrayList<String> list2 = new ArrayList<>();
        list1.addAll( Arrays.asList(str1.split("\n")));
        list2.addAll( Arrays.asList(str2.split("\n")));

        int listSize1 = list1.size();
        int listSize2 = list2.size();

        if(listSize1 > listSize2){
            for (int i = 0; i < listSize1-listSize2; i++){
                list2.add("");
            }
        }else {
            for (int i = 0; i < listSize2-listSize1; i++){
                list1.add("");
            }
        }

        for(int i = 0; i < list1.size(); i ++){
            if(!list2.get(i).equals(list1.get(i))){
                int line = i + 1;
                if(list1.get(i).equals("")){
                    result += "Added " + line + " " + list2.get(i) + "\n";
                }else if(list2.get(i).equals("")) {
                    result += "Deleted " + line + "\n";
                }else {
                    result += "Updated " + line + " " + list2.get(i) + "\n";

                }
            }
        }
        return result;
    }
    public static String apply(String originalString, String listOfChanges)
    {
        return "stub";
    }
}