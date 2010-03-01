package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

public class RandomAccessFileExample {

    public static void doAccess(String path,String oldname,String newname) {
        try {
            File file = new File(path+oldname);

            RandomAccessFile raf = new RandomAccessFile(file, "r");
  
            long i =raf.length();   
            
            byte[] b = new byte[(int)i];   
            raf.seek(0);   
            raf.readFully(b);   
            File f =new File(path,newname);  

            RandomAccessFile paste = new RandomAccessFile(f,"rw");   
            paste.write(b);   
            raf.close();
            paste.close();   
        } catch (IOException e) {
            System.out.println("IOException:");
            e.printStackTrace();
        }
    }


    /**
     * Sole entry point to the class and application.
     * @param args Array of String arguments.
     */

    public static void main(String[] args) throws Exception{

//        doAccess("E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\","upload.mdb","dbback.mdb");
//        ToZipFile.zipFile("E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\dbback.mdb","E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\upload.zip");

    }

}

