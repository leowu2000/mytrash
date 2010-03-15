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
       
    public static final String ZIP_FILENAME = "C:\\XJPDA.zip";//��Ҫ��ѹ�����ļ���   
    public static final String ZIP_DIR = "C:\\XJPDA\\";//��Ҫѹ�����ļ���   
    public static final String UN_ZIP_DIR = "C:\\";//Ҫ��ѹ���ļ�Ŀ¼   
    public static final int BUFFER = 1024 ;//�����С   
       
    public static void zipFile(String filepath,String zipfilepath) throws Exception{ 
    	File zipFile = new File(zipfilepath);
    	if(zipFile.exists()){
    		zipFile.delete();
    	}  
     // �����ļ����������   
        FileOutputStream fouts = new FileOutputStream(zipFile);   

        CheckedOutputStream ch = new CheckedOutputStream(fouts, new CRC32());   
        // ����ZIP�������������   
        ZipOutputStream zipOut = new ZipOutputStream(   
                new BufferedOutputStream(ch));     
            File f=new File(filepath);
        	try {   
	            // �����ļ�����������   
	            BufferedReader in = new BufferedReader(new InputStreamReader(   
	                    new FileInputStream(f), "ISO8859_1"));   
	           
	            // ����ָ��ѹ��ԭʼ�ļ������   
	            ZipEntry entry = new ZipEntry(f.getName());   
	            zipOut.putNextEntry(entry);   
	            // ��ѹ���ļ����������   
	            int nNumber;   
	            while ((nNumber = in.read()) != -1) {   
	                zipOut.write(nNumber);   
	            }   
	            in.close();  
	            f.delete();
            } catch (IOException e) {   
                e.printStackTrace();
            }   
            
        // �رմ�����������   
        zipOut.close(); 
    }        
  
}  

