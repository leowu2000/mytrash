package com.basesoft.modules.media;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.web.multipart.MultipartFile;

import com.basesoft.core.CommonDAO;

public class GctpDAO extends CommonDAO {

	/**
	 * 获取工程图片信息
	 * @param gclj
	 * @return
	 */
	public List<?> findGctp(String gclj){
		String sql = "select * from TB_GCTP where GCLJ='" + gclj + "'";
		return jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 根据id获取实例
	 * @param id
	 * @return
	 */
	public Gctp findById(String id){
		Gctp gctp = new Gctp();
		
		String sql = "select * from TB_GCTP where ID='" + id + "'";
		List list = jdbcTemplate.queryForList(sql);
		if(list.size()>0){
			Map map = (Map)list.get(0);
			gctp.setId(id);
			gctp.setName(map.get("NAME")==null?"":map.get("NAME").toString());
			gctp.setNote(map.get("NOTE")==null?"":map.get("NOTE").toString());
			gctp.setGclj(map.get("GCLJ")==null?"":map.get("GCLJ").toString());
		}
		
		return gctp;
	}
	
	/**
	 * 存储工程图片
	 * @param Gctp 工程图片实例
	 * @param f 图片文件
	 */
	public void addGctp(Gctp gctp, MultipartFile f)throws Exception{
		final InputStream is = f.getInputStream();
		final int length = (int)f.getSize();
		final String id = gctp.getId();
		final String name = gctp.getName();
		final String note = gctp.getNote();
		final String gclj = gctp.getGclj();
		
		final LobHandler lobHandler=new DefaultLobHandler();
		jdbcTemplate.execute("insert into TB_GCTP values (?,?,?,?,?)",
			new AbstractLobCreatingPreparedStatementCallback(lobHandler){ 
				protected void setValues(PreparedStatement pstmt,LobCreator lobCreator) throws SQLException{
					pstmt.setString(1, id);
					pstmt.setString(2, name);
					pstmt.setString(3, note);
					lobCreator.setBlobAsBinaryStream(pstmt,4,is,length);
					pstmt.setString(5, gclj);
				}
			}
		);
		is.close();
	}
	
	/**
	 * 更新工程图片
	 * @param Gctp 工程图片实例
	 * @param f 图片文件
	 */
	public void updateGctp(Gctp gctp, MultipartFile f)throws Exception{
		final InputStream is = f.getInputStream();
		final int length = (int)f.getSize();
		final String id = gctp.getId();
		final String name = gctp.getName();
		final String note = gctp.getNote();
		final String gclj = gctp.getGclj();
		
		final LobHandler lobHandler=new DefaultLobHandler();
		jdbcTemplate.execute("update TB_GCTP set name=?,note=?,content=? where ID='" + id + "'",
			new AbstractLobCreatingPreparedStatementCallback(lobHandler){ 
				protected void setValues(PreparedStatement pstmt,LobCreator lobCreator) throws SQLException{
					pstmt.setString(1, name);
					pstmt.setString(2, note);
					lobCreator.setBlobAsBinaryStream(pstmt,3,is,length);
				}
			}
		);
		is.close();
	}
	
	/**
	 * 更新工程图片
	 * @param Gctp 工程图片实例
	 */
	public void updateGctp(Gctp gctp)throws Exception{
		final String id = gctp.getId();
		final String name = gctp.getName();
		final String note = gctp.getNote();
		final String gclj = gctp.getGclj();
		
		final LobHandler lobHandler=new DefaultLobHandler();
		jdbcTemplate.execute("update TB_GCTP set name=?,note=? where ID='" + id + "'",
			new AbstractLobCreatingPreparedStatementCallback(lobHandler){ 
				protected void setValues(PreparedStatement pstmt,LobCreator lobCreator) throws SQLException{
					pstmt.setString(1, name);
					pstmt.setString(2, note);
				}
			}
		);
	}
}
