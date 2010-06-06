package com.basesoft.modules.media;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

import com.basesoft.core.CommonDAO;
import com.kingbase.largeobject.BlobInputStream;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class MediaDAO extends CommonDAO {

	/**
	 * 取得BLOB信息
	 * @param tablename 表名
	 * @param pId 编号
	 * @return
	 */
	synchronized public InputStream getBlob(String tablename, String pId){
		String sql = "select lxzp from " + tablename + " where zlbm ='" + pId + "'";
		InputStream inputstream = (InputStream) jdbcTemplate.execute(sql, new CallableStatementCallback() {   
			public Object doInCallableStatement(CallableStatement stmt)throws SQLException,DataAccessException {   
				ResultSet rs = stmt.executeQuery();   
				Map map = new HashMap();   
				String name = "";   
				
				rs.next();
				InputStream inputStream = rs.getBinaryStream("lxzp");// 读取blob 
				rs.close();
				
				return inputStream;  
			}   
				  
		});   
		return inputstream; 
	}
	
	/**
	 * 取得工程图片BLOB信息
	 * @param id 
	 * @return
	 */
	synchronized public InputStream getGctpBlob(String id){
		String sql = "select CONTENT from TB_GCTP where ID ='" + id + "'";
		InputStream inputstream = (InputStream) jdbcTemplate.execute(sql, new CallableStatementCallback() {   
			public Object doInCallableStatement(CallableStatement stmt)throws SQLException,DataAccessException {   
				ResultSet rs = stmt.executeQuery();   
				Map map = new HashMap();   
				String name = "";   
				
				rs.next();
				InputStream inputStream = rs.getBinaryStream("CONTENT");// 读取blob 
				rs.close();
				
				return inputStream;  
			}   
				  
		});   
		return inputstream; 
	}
	
	/**
	 * 将流存为文件
	 * @param ins 输入流
	 * @param path 文件路径
	 * @return 返回文件比特数组
	 */
	synchronized public byte[] saveAsFile(InputStream ins, String path) throws Exception{
		//写入文件
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
    	}
		//流中数据写入文件
		FileOutputStream fos = new FileOutputStream(file);
    	BufferedOutputStream buffOut = new BufferedOutputStream(fos);
    	byte buf[]=new byte[2048];
        for(int i=0;(i=ins.read(buf))>0;){
        	buffOut.write(buf,0,i);
        }
        buffOut.close();
        fos.close();

        //将文件读为byte[]
        FileInputStream fis = new FileInputStream(file);
        byte[] b = new byte[fis.available()];
        fis.read(b);
        fis.close();
        
		return b;
	}
	
	/**
	 * 获取多媒体信息
	 * @param tablename 表名
	 * @param media_id 多媒体id
	 * @return
	 */
	public Map getMedia(String tablename, String media_id){
		Map map = new HashMap();
		
		List list = jdbcTemplate.queryForList("select * from " + tablename + " where zlbm ='" + media_id + "'");
		if(list.size()>0){
			map = (Map)list.get(0);
		}
		
		return map;
	}
	
	/**
	 * 获取缩略图
	 * @param oldPic 原图
	 * @param newPic 生成的缩略图
	 * @return
	 */
	synchronized public byte[] getNewPic(String path, int size)throws Exception {
        //原图文件
    	File oldFile = new File(path + "\\temp.jpg");
        //新图文件
        String newPath = path + "\\temp2.jpg";
        File newFile = new File(newPath);
        if(!newFile.exists()){
        	newFile.createNewFile();
    	}
        
        // 构造Image对象
        Image src = ImageIO.read(oldFile); 
        BufferedImage tag = new BufferedImage(size, size,BufferedImage.TYPE_INT_RGB);
        tag.getGraphics().drawImage(src, 0, 0, size, size, null); // 绘制缩小后的图
        
        FileOutputStream newStrOut = new FileOutputStream(newFile);// 输出到文件流
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newStrOut);
        encoder.encode(tag); // JPEG编码
        
        FileInputStream newStrIn = new FileInputStream(newFile);
        byte[] newPic = new byte[newStrIn.available()];
        newStrIn.read(newPic);
        
        newStrIn.close();
        newStrOut.close();
        
        return newPic;
	}
}
