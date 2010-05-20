package com.util;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;



import org.apache.tools.zip.ZipEntry;   
import org.apache.tools.zip.ZipOutputStream; 

public class ToZipFile {   
       
    public static final String ZIP_FILENAME = "C:\\XJPDA.zip";//需要解压缩的文件名   
    public static final String ZIP_DIR = "C:\\XJPDA\\";//需要压缩的文件夹   
    public static final String UN_ZIP_DIR = "C:\\";//要解压的文件目录   
    public static final int BUFFER = 1024 ;//缓存大小   
       
    public static void zipFile(String filepath,String zipfilepath) throws Exception{ 
    	File zipFile = new File(zipfilepath);
    	if(zipFile.exists()){
    		zipFile.delete();
    	}  
     // 创建文件输出流对象   
        FileOutputStream fouts = new FileOutputStream(zipFile);   

        CheckedOutputStream ch = new CheckedOutputStream(fouts, new CRC32());   
        // 创建ZIP数据输出流对象   
        ZipOutputStream zipOut = new ZipOutputStream(   
                new BufferedOutputStream(ch));     
            File f=new File(filepath);
        	try {   
	            // 创建文件输入流对象   
	            BufferedReader in = new BufferedReader(new InputStreamReader(   
	                    new FileInputStream(f), "ISO8859_1"));   
	           
	            // 创建指向压缩原始文件的入口   
	            ZipEntry entry = new ZipEntry(f.getName());   
	            zipOut.putNextEntry(entry);   
	            // 向压缩文件中输出数据   
	            int nNumber;   
	            while ((nNumber = in.read()) != -1) {   
	                zipOut.write(nNumber);   
	            }   
	            in.close();  
//	            f.delete();
            } catch (IOException e) {   
                e.printStackTrace();
            }   
            
        // 关闭创建的流对象   
        zipOut.close(); 
    }        
  
}  

