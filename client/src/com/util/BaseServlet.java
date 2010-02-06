package com.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buiness.dao.BuinessDao;
import com.buiness.form.PrjBean;

public class BaseServlet extends HttpServlet{
	public BaseServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//cntcd,PROVNM
		String path = request.getRealPath("/");
		String type = request.getParameter("type");
		String val = request.getParameter("val");
		String cntcd = request.getParameter("cntcd");
		
		String hlxx[]={"","","",""};
		if(val!=null &&val.length()>0){
			hlxx= BuinessDao.getPrjLyxx(val, path).split("-"); 
		}
		String xzqh[] = {"","",""};
		if(cntcd!=null &&cntcd.length()>0){
			xzqh= BuinessDao.getXzqhxx(cntcd,path).split("-");
		}
//		if("gqcj".trim().equals(type)){
//			String result = 
//			
//		}
		if("load".trim().equals(type)){
			String result="";
			String result_z="";
			String result_head_z="<select name='selectz' onchange='javascript:changeValue("+"\"sx"+"\","+"\"1"+"\",this)'>";
			String result_detail_z="</select>";
			String result_s="";
			String result_head_s="<select name='selects'onchange='javascript:changeValue("+"\"sx"+"\","+"\"2"+"\",this)'>";
			String result_detail_s="</select>";
			String result_x="";
			String result_head_x="<select name='selectx'>";
			String result_detail_x="</select>";
			
			String result_gcgl="";
			String result_head_gcgl="<select name='selectgcgl'>";
			String result_detail_gcgl="</select>";
			
			String result_lysx1="";
			String result_head_lysx1="<select name='selectlysx1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"1"+"\",this)'>";
			String result_detail_lysx1="</select>";
			String result_lysx2="";
			String result_head_lysx2="<select name='selectlysx2' onchange='javascript:changeValue("+"\"ly"+"\","+"\"2"+"\",this)'>";
			String result_detail_lysx2="</select>";
			String result_zl1="";
			String result_head_zl1="<select name='selectzl1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"3"+"\",this)'>";
			String result_detail_zl1="</select>";
			String result_zl2="";
			String result_head_zl2="<select name='selectzl2'>";
			String result_detail_zl2="</select>";

			List<TbcntBean> sxList = BaseUtil.getAllSXList(path);
			String shbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[0]+"'");
			if(sxList !=null && sxList.size()>0){
				for(int i=0;i<sxList.size();i++){
					TbcntBean bean = (TbcntBean)sxList.get(i);
					if(shbm.trim().equals(bean.getCntcd()))
						result_z +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_z +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			
			List<TbcntBean> sList = BaseUtil.getAllSHList(path, shbm==""?((TbcntBean)sxList.get(0)).getCntcd():shbm);
			String sbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[1]+"'");
			if(sList !=null && sList.size()>0){
				for(int i=0;i<sList.size();i++){
					TbcntBean bean = (TbcntBean)sList.get(i);
					if(sbm.trim().equals(bean.getCntcd()))
						result_s +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_s +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
//				TbcntBean bean = (TbcntBean)sList.get(0);
//				result_s+="<option value='"+bean.getCntcd().substring(0,3)+"200'>"+bean.getProvnm().trim().substring(0,3)+"郊区县</option>";
			}
			
			List<TbcntBean> xList = BaseUtil.getAllXList(path, sbm==""?((TbcntBean)sList.get(0)).getCntcd():sbm);
			String xianbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[2]+"'");
			if(xList !=null && xList.size()>0){
				for(int i=0;i<xList.size();i++){
					TbcntBean bean = (TbcntBean)xList.get(i);
					if(xianbm.trim().equals(bean.getCntcd()))
						result_x +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_x +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			List<GclbBean> gcglList = BaseUtil.getGclbList(path);
			String gclb = BuinessDao.idToNameChange(path,"TB_GCLB", "gcfldm",  "gcfldm=Mid('"+val+"',1,1)");
			if(gcglList !=null && gcglList.size()>0){
				for(int i=0;i<gcglList.size();i++){
					GclbBean bean = (GclbBean)gcglList.get(i);
					if(gclb.trim().equals(bean.getGCFLDM()))
						result_gcgl +="<option value='"+bean.getGCFLDM()+"' selected=true>"+bean.getGCFLMC().trim()+"</option>";
					result_gcgl +="<option value='"+bean.getGCFLDM()+"'>"+bean.getGCFLMC().trim()+"</option>";
				}
			}
			
			List<LysxBean> lysl1List = BaseUtil.getLysxList_one(path);
			String LY_one = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[0]+"'");
			if(lysl1List !=null && lysl1List.size()>0){
				for(int i=0;i<lysl1List.size();i++){
					LysxBean bean = (LysxBean)lysl1List.get(i);
					if(LY_one.trim().equals(bean.getCTCD().trim()))
						result_lysx1 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_lysx1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			
			List<LysxBean> lysl2List = BaseUtil.getLysxList_two(path,LY_one==""?((LysxBean)lysl1List.get(0)).getCTCD():LY_one);
			String LY_two = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[1]+"'");
			if(lysl2List !=null && lysl2List.size()>0){
				for(int i=0;i<lysl2List.size();i++){
					LysxBean bean = (LysxBean)lysl2List.get(i);
					if(LY_two.trim().equals(bean.getCTCD().trim()))
						result_lysx2 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_lysx2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			List<LysxBean> zl1List = BaseUtil.getZliuList_one(path, LY_two==""?((LysxBean)lysl2List.get(0)).getCTCD():LY_two);
			String LY_zone = BuinessDao.idToNameChange(path,"tb_lysx", "CTCD",  "CTNM='"+hlxx[2]+"'");
			if(zl1List !=null && zl1List.size()>0){
				for(int i=0;i<zl1List.size();i++){
					LysxBean bean = (LysxBean)zl1List.get(i);
					if(LY_zone.trim().equals(bean.getCTCD().trim()))
						result_zl1 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_zl1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			List<LysxBean> zl2List = BaseUtil.getZliuList_two(path, LY_zone==""?((LysxBean)zl1List.get(0)).getCTCD():LY_zone);
			if(zl2List !=null && zl2List.size()>0){
				for(int i=0;i<zl2List.size();i++){
					LysxBean bean = (LysxBean)zl2List.get(i);
					if(hlxx[3].trim().equals(bean.getCTNM().trim()))
						result_zl2 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_zl2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			result_z = result_head_z+result_z+result_detail_z;
			result_s = result_head_s+result_s+result_detail_s;
			result_x = result_head_x+result_x+result_detail_x;
			result_gcgl = result_head_gcgl+result_gcgl+result_detail_gcgl;
			result_lysx1 = result_head_lysx1+result_lysx1+result_detail_lysx1;
			result_lysx2 = result_head_lysx2+result_lysx2+result_detail_lysx2;
			result_zl1 = result_head_zl1+result_zl1+result_detail_zl1;
			result_zl2 = result_head_zl2+result_zl2+result_detail_zl2;
			result=result_z+";"+result_s+";"+result_x+";"+result_gcgl+";"+result_lysx1+";"+result_lysx2+";"+result_zl1+";"+result_zl2;
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
		}
		if("viewload".trim().equals(type)){
			String result="";
			String result_z=xzqh[0];
			String result_s=xzqh[1];
			String result_x=xzqh[2];
			
			String result_gcgl=BuinessDao.idToNameChange(path,"TB_GCLB", "GCFLMC",  "gcfldm=Mid('"+val+"',1,1)");;
			
			String result_lysx1=hlxx[0];
			String result_lysx2=hlxx[1];
			String result_zl1=hlxx[2];
			String result_zl2=hlxx[3];

			result=result_z+";"+result_s+";"+result_x+";"+result_gcgl+";"+result_lysx1+";"+result_lysx2+";"+result_zl1+";"+result_zl2;
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
			
		}
		if("change".trim().equals(type)){
			String changeObjName = request.getParameter("changeObjName");
			String changeType = request.getParameter("changeType");
			String changeVal = request.getParameter("changeVal");
			String result="";
			if("sx".trim().equals(changeObjName)){
				if("1".trim().equals(changeType)){
					String result_s="";
					String result_head_s="<select name='selects' onchange='javascript:changeValue("+"\"sx"+"\","+"\"2"+"\",this)'>";
					String result_detail_s="</select>";
					String result_x="";
					String result_head_x="<select name='selectx'>";
					String result_detail_x="</select>";
					List<TbcntBean> sList = BaseUtil.getAllSHList(path, changeVal);
					if(sList !=null && sList.size()>0){
						for(int i=0;i<sList.size();i++){
							TbcntBean bean = (TbcntBean)sList.get(i);
							result_s +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
						}
//						TbcntBean bean = (TbcntBean)sList.get(0);
//						result_s+="<option value='"+bean.getCntcd().substring(0,3)+"200'>"+bean.getProvnm().trim().substring(0,3)+"郊区县</option>";
					}
					List<TbcntBean> xList = BaseUtil.getAllXList(path, ((TbcntBean)sList.get(0)).getCntcd());
					if(xList !=null && xList.size()>0){
						for(int i=0;i<xList.size();i++){
							TbcntBean bean = (TbcntBean)xList.get(i);
							result_x +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
						}
					}
					result_s = result_head_s+result_s+result_detail_s;
					result_x = result_head_x+result_x+result_detail_x;
					result=result_s+";"+result_x;
					
				}else{
					String result_x="";
					String result_head_x="<select name='selectx'>";
					String result_detail_x="</select>";
					List<TbcntBean> xList = BaseUtil.getAllXList(path, changeVal);
					if(xList !=null && xList.size()>0){
						for(int i=0;i<xList.size();i++){
							TbcntBean bean = (TbcntBean)xList.get(i);
							result_x +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
						}
					}
					result_x = result_head_x+result_x+result_detail_x;
					result = result_x;
				}
				response.setContentType("text/xml");
				response.setHeader("Charset", "gb2312");
				response.addHeader("Cache-Control", "no-cache");
				response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
			}
			if("ly".trim().equals(changeObjName)){
				if("1".trim().equals(changeType)){
					String result_lysx2="";
					String result_head_lysx2="<select name='selectlysx2' onchange='javascript:changeValue("+"\"ly"+"\","+"\"2"+"\",this)'>";
					String result_detail_lysx2="</select>";
					String result_zl1="";
					String result_head_zl1="<select name='selectzl1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"3"+"\",this)'>";
					String result_detail_zl1="</select>";
					String result_zl2="";
					String result_head_zl2="<select name='selectzl2'>";
					String result_detail_zl2="</select>";
					List<LysxBean> lysl2List = BaseUtil.getLysxList_two(path,changeVal);
					if(lysl2List !=null && lysl2List.size()>0){
						for(int i=0;i<lysl2List.size();i++){
							LysxBean bean = (LysxBean)lysl2List.get(i);
							result_lysx2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					List<LysxBean> zl1List = BaseUtil.getZliuList_one(path, ((LysxBean)lysl2List.get(0)).getCTCD());
					if(zl1List !=null && zl1List.size()>0){
						for(int i=0;i<zl1List.size();i++){
							LysxBean bean = (LysxBean)zl1List.get(i);
							result_zl1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					List<LysxBean> zl2List = BaseUtil.getZliuList_two(path, ((LysxBean)zl1List.get(0)).getCTCD());
					if(zl2List !=null && zl2List.size()>0){
						for(int i=0;i<zl2List.size();i++){
							LysxBean bean = (LysxBean)zl2List.get(i);
							result_zl2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					result_lysx2 = result_head_lysx2+result_lysx2+result_detail_lysx2;
					result_zl1 = result_head_zl1+result_zl1+result_detail_zl1;
					result_zl2 = result_head_zl2+result_zl2+result_detail_zl2;
					result=result_lysx2+";"+result_zl1+";"+result_zl2;
				}
				if("2".trim().equals(changeType)){
					String result_zl1="";
					String result_head_zl1="<select name='selectzl1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"3"+"\",this)'>";
					String result_detail_zl1="</select>";
					String result_zl2="";
					String result_head_zl2="<select name='selectzl2'>";
					String result_detail_zl2="</select>";
					List<LysxBean> zl1List = BaseUtil.getZliuList_one(path, changeVal);
					if(zl1List !=null && zl1List.size()>0){
						for(int i=0;i<zl1List.size();i++){
							LysxBean bean = (LysxBean)zl1List.get(i);
							result_zl1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					List<LysxBean> zl2List = BaseUtil.getZliuList_two(path, ((LysxBean)zl1List.get(0)).getCTCD());
					if(zl2List !=null && zl2List.size()>0){
						for(int i=0;i<zl2List.size();i++){
							LysxBean bean = (LysxBean)zl2List.get(i);
							result_zl2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					result_zl1 = result_head_zl1+result_zl1+result_detail_zl1;
					result_zl2 = result_head_zl2+result_zl2+result_detail_zl2;
					result=result_zl1+";"+result_zl2;
				}
				if("3".trim().equals(changeType)){
					String result_zl2="";
					String result_head_zl2="<select name='selectzl2'>";
					String result_detail_zl2="</select>";
					List<LysxBean> zl2List = BaseUtil.getZliuList_two(path, changeVal);
					if(zl2List !=null && zl2List.size()>0){
						for(int i=0;i<zl2List.size();i++){
							LysxBean bean = (LysxBean)zl2List.get(i);
							result_zl2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
						}
					}
					result_zl2 = result_head_zl2+result_zl2+result_detail_zl2;
					result=result_zl2;
				}
				response.setContentType("text/xml");
				response.setHeader("Charset", "gb2312");
				response.addHeader("Cache-Control", "no-cache");
				response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
			}
		}
	}
	public void init() throws ServletException {
		// Put your code here
	}
}
