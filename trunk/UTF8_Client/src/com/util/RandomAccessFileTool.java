package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;

public class RandomAccessFileTool {

    public static void doAccess(String path,String oldname,String newname) {
        try {
            File file = new File(path+"/"+oldname);

            RandomAccessFile raf = new RandomAccessFile(file, "r");
  
            long i =raf.length();   
            
            byte[] b = new byte[(int)i];   
            raf.seek(0);   
            raf.readFully(b);   
            File f =new File(path+"/"+newname);  

            RandomAccessFile paste = new RandomAccessFile(f,"rw");   
            paste.write(b);   
            raf.close();
            paste.close();   
        } catch (IOException e) {
            System.out.println("IOException:");
            e.printStackTrace();
        }
    }
  //删除指定文件夹下所有文件
  //param path 文件夹完整绝对路径
     public static boolean delAllFile(String path) {
         boolean flag = false;
         File file = new File(path);
         if (!file.exists()) {
           return flag;
         }
         if (!file.isDirectory()) {
           return flag;
         }
         String[] tempList = file.list();
         File temp = null;
         for (int i = 0; i < tempList.length; i++) {
            if (path.endsWith(File.separator)) {
               temp = new File(path + tempList[i]);
            } else {
                temp = new File(path + File.separator + tempList[i]);
            }
            if (temp.isFile()) {
               temp.delete();
            }
            if (temp.isDirectory()) {
               delAllFile(path + "/" + tempList[i]);//先删除文件夹里面的文件
               flag = true;
            }
         }
         return flag;
       }


    /**
     * Sole entry point to the class and application.
     * @param args Array of String arguments.
     */

    public static void main(String[] args) throws Exception{

//        doAccess("E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\","upload.mdb","dbback.mdb");
//        ToZipFile.zipFile("E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\dbback.mdb","E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\upload.zip");
//    	delAllFile("E:\\EclipseWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\SSGQ_CJ\\common\\pic");

    }

}

