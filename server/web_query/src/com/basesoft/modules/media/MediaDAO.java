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
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class MediaDAO extends CommonDAO {

	/**
	 * 取得BLOB信息
	 * @param tablename 表名
	 * @param pId 编号
	 * @return
	 */
	public Map getBlob(String tablename, String pId){
		String sql = "select lxzp from " + tablename + " where zlbm ='" + pId + "'";
		Map map = (Map) jdbcTemplate.execute(sql, new CallableStatementCallback() {   
			public Object doInCallableStatement(CallableStatement stmt)throws SQLException,DataAccessException {   
				ResultSet rs = stmt.executeQuery();   
				Map map = new HashMap();   
				InputStream inputStream = null;   
				String name = "";   
				
				rs.next();
				inputStream = rs.getBinaryStream("lxzp");// 读取blob  
				byte[] b = new byte[500000];
				try{
					inputStream.read(b);
					inputStream.close();
				}catch(IOException e){
					System.out.println(e);
				}
				map.put("lxzp", b);
				
				rs.close();
				
				return map;  
			}   
				  
		});   
		return map; 
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
	public byte[] getNewPic(byte[] oldPic, String path) {
        byte[] newPic = new byte[5000];
		
        try {
        	//生成原图的文件
        	String oldPath = path + "\\oldFile.jpg";
        	File oldFile = new File(oldPath);
        	if(!oldFile.exists()){
        		oldFile.createNewFile();
        	}
        	FileOutputStream oldStr = new FileOutputStream(oldPath);
        	BufferedOutputStream buffOut = new BufferedOutputStream(oldStr);
        	buffOut.write(oldPic);
        	buffOut.close();
        	oldStr.close();
        	
            //新图文件
            String newPath = path + "\\newFile.jpg";
            File newFile = new File(newPath);
            if(!newFile.exists()){
            	newFile.createNewFile();
        	}
            
            // 构造Image对象
            Image src = ImageIO.read(oldFile); 
            BufferedImage tag = new BufferedImage(30, 30,BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(src, 0, 0, 30, 30, null); // 绘制缩小后的图
            
            FileOutputStream newStrOut = new FileOutputStream(newFile);// 输出到文件流
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newStrOut);
            encoder.encode(tag); // 近JPEG编码
            
            FileInputStream newStrIn = new FileInputStream(newFile);
            BufferedInputStream buffIn= new BufferedInputStream(newStrIn);
            newPic = new byte[Integer.parseInt(String.valueOf(newFile.length()))];
            buffIn.read(newPic);
            
            buffIn.close();
            newStrIn.close();
            newStrOut.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
        
        return newPic;
        
    }

}
