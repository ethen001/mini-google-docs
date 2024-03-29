package org.guccigang.mini_google_docs.model;

public class DebugUtil
{
    public static void execCommand(String[] args)
    {
        if(args[0].equals("patch"))
            System.out.println(VersionUtil.getChanges(args[1], args[2]));
        else if(args[0].equals("accept"))
            System.out.println(VersionUtil.applyChanges(args[1],args[2]));
        else if(args[0].equals("patch-test"))
        {
            String tempPatch = VersionUtil.getChanges(args[1], args[2]);
            String tempPatched =  VersionUtil.applyChanges(args[1],tempPatch);
            if(args[2].equals(tempPatched))
            {
                System.out.println("It works! " + args[2] + " = " + tempPatched);
            }
            else
            {
                System.out.println("It doesn't work! " + args[2] + " = " + tempPatched);
            }
        }
        else if(args[0].equals("save"))
        {
            VersionUtil.save(Integer.parseInt(args[1]), args[2], args[3]);//
        }
        else if(args[0].equals("create"))
        {
            try {
                int id = VersionUtil.create(args[1], args[2]);//owner,string
                System.out.println("Created docID "+id);
            }catch (java.sql.SQLException e)
            {
                System.out.println(e);
            }
        }
        else if(args[0].equals("open"))
        {
            try {
                String text = VersionUtil.openVersion(Integer.parseInt(args[1]), Integer.parseInt(args[2]));//owner,string
                System.out.println("Text: "+text);
            }catch (java.sql.SQLException e)
            {
                System.out.println(e);
            }
        }
    }
}
