package com.basesoft.modules.media;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
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
				byte[] b = new byte[7500000];
				try{
					b = new byte[inputStream.available()];
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
	
	public byte[] build(File oldPic, File newPic) {
        byte[] b = new byte[500];
		
		FileOutputStream newimage = null;
        try {
            Image src = ImageIO.read(oldPic); // 构造Image对象
            //float tagsize = 200;    //限制宽度为200
            int old_w = src.getWidth(null); // 得到源图宽
            int old_h = src.getHeight(null);// 得到源图高
            
            int new_w = 30;    //缩略图宽,
            int new_h = 30;  //缩略图高
            
            BufferedImage tag = new BufferedImage(new_w, new_h,BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(src, 0, 0, new_w, new_h, null); // 绘制缩小后的图
            
            newimage = new FileOutputStream(newPic);// 输出到文件流
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
            encoder.encode(tag); // 近JPEG编码
            
            newimage.write(b);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return b ;
        
    }

}
