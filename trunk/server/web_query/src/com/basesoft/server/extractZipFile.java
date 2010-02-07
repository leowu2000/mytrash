package com.basesoft.server;
//将从一个工情数据（mdb类型）zip文件中将指定的文件解压缩到指定的文件名称中。
//参数：
// 1、zipFileName:    zip文件名称
// 2、sourceFileName: 要被解压缩的文件名称
// 3、outputFileName: 要被解压缩的文件解压缩后的文件名称
// 
// 问题：
// 数据zip文件中的压缩文件名称不能为中文！！！ 否则无法释放：getNextEntry语句出错。

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class extractZipFile
{

private String zipFileName="";
private String sourceFileName="";
private String outputFileName="";

public void setZipFileName( String sZipFileName)
{
zipFileName = sZipFileName;
}

public void setSourceFileName( String sSourceFileName)
{
sourceFileName = sSourceFileName;
}

public void setOutputFileName( String sOutputFileName)
{
outputFileName = sOutputFileName;
}
 
public boolean extractFile()
{
 if ( zipFileName.equals("") )
 {
    System.out.println("您没有指定压缩文件名称。");
    return false;
 }

 if ( sourceFileName.equals("") )
 {
    System.out.println("您没有指定要解压缩哪一个文件。");
    return false;
 }
 if ( outputFileName.equals("") )
 {
    System.out.println("您没有指定解压缩到哪个文件。");
    return false;
 }
 
 byte buffer[] = new byte[1024];
 try //1
 {
    //open archive file
    FileInputStream stream = new FileInputStream( zipFileName );
    System.out.println("\nzipFileName :" +zipFileName );
    
    ZipInputStream zipStream = new ZipInputStream( stream );

    
    //find archive entry
    ZipEntry zipExtract = null;
    while(true)
    {
    	try
    	   {
       	   zipExtract = zipStream.getNextEntry();
    	   }
	catch(Exception e)
	   {
	    System.out.println("\nextractFile：找不到入口："+e.getMessage() + "\n");
	   }
       if (zipExtract == null)
          {
          System.out.println("\n\nZIP包中没有文件：" + sourceFileName+"\n\n");
          break;
          }
       if (zipExtract.getName().equals(sourceFileName))
          {
          System.out.println("\n\nZIP包中的文件名：" + sourceFileName+"\n\n");
          break;
          }
       zipStream.closeEntry();
    }
    
    if (zipExtract == null || !zipExtract.getName().equals(sourceFileName))
    {
       stream.close();
       System.out.println("在"+ zipFileName +"中找不到要展开的文件："+ sourceFileName);
       return false;
    }
    //create output file
    FileOutputStream output = new FileOutputStream(outputFileName);
    
    //check store CRC
    long crcReq = zipExtract.getCrc();
    CRC32 crc = new CRC32();
    
    //read input & write to output
    while(true)
    {
       int nRead = zipStream.read(buffer,0,buffer.length);
       if (nRead <= 0)
       {
        break;  
       }
       
       output.write(buffer,0,nRead);
       crc.update(buffer,0,nRead);
    }
    
    //close all
    output.close();
    zipStream.closeEntry();
    stream.close();
    
    //check CRC value, if avaiable
    if ( crcReq != -1 && crc.getValue() != crcReq )
    {
       System.out.println(outputFileName + "CRC 校验错误。");
       return false;
    }
    
 }
 catch(Exception e)
 {
    System.out.println("错误："+e.getMessage());
    return false;
 }
 
System.out.println("文件" + sourceFileName + "已经被解压缩为："+ outputFileName);

return true;

}	

}
//class extractZipFile end.
