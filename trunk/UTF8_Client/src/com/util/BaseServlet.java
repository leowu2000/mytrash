﻿package com.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buiness.dao.BuinessDao;
import com.buiness.form.ConfigBean;
import com.buiness.form.FXJBBean;
import com.buiness.form.STDNCBean;

public class BaseServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
		String from = request.getParameter("from");//用于区分请求下拉框的来源
		String path = request.getSession().getServletContext().getRealPath("/");
		String type = request.getParameter("type");
		String val = request.getParameter("val");
		String cntcd = request.getParameter("cntcd");
		ConfigBean cfbean = (ConfigBean)request.getSession().getAttribute("configBean");
		String hlxx[]={"","","",""};
		String xzqh[] = {"","",""};
		String result="";
		boolean disableFlg = false;
		
		if("add".trim().equals(from))disableFlg = true;//新增工程的时候显示下来框，不允许选择其他省和地区
		if("config".trim().equals(from)){//参数设置页
			hlxx = cntcd.split("-");
			xzqh = val.split("-");
		}else{
			if(val!=null &&val.length()>0){
				hlxx= BuinessDao.getPrjLyxx(val, path).split("-"); 
			}
			if(cntcd!=null &&cntcd.length()>0){
				xzqh= BuinessDao.getXzqhxx(cntcd,path).split("-");
			}
		}
		if("load".trim().equals(type)){//新增页
			String result_z="";
			String result_head_z="";
			String result_head_s="";
			String result_head_x="";
			String result_head_lysx1="";
			String result_head_lysx2="";
			String result_head_zl1="";
			String result_head_zl2="";
			
			if(disableFlg){
				result_head_z="<select name='selectz' disabled>";
				result_head_s="<select name='selects' disabled>";
				result_head_x="<select name='selectx' disabled>";
				
				result_head_lysx1="<select name='selectlysx1' disabled>";
				result_head_lysx2="<select name='selectlysx2' disabled>";
				result_head_zl1="<select name='selectzl1'>";
				result_head_zl2="<select name='selectzl2'>";
			}
			else{
				result_head_z="<select name='selectz' onchange='javascript:changeValue("+"\"sx"+"\","+"\"1"+"\",this)' disabled>";
				result_head_s="<select name='selects' onchange='javascript:changeValue("+"\"sx"+"\","+"\"2"+"\",this)' disabled>";
				result_head_x="<select name='selectx'>";
				
				result_head_lysx1="<select name='selectlysx1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"1"+"\",this)'>";
				result_head_lysx2="<select name='selectlysx2' onchange='javascript:changeValue("+"\"ly"+"\","+"\"2"+"\",this)'>";
				result_head_zl1="<select name='selectzl1' onchange='javascript:changeValue("+"\"ly"+"\","+"\"3"+"\",this)'>";
				result_head_zl2="<select name='selectzl2'>";
			}
			String result_detail_z="</select>";
			String result_s="";
			
			String result_detail_s="</select>";
			String result_x="";
			String result_detail_x="</select>";
			
			String result_gcgl="";
			String result_head_gcgl="<select name='selectgcgl'>";
			String result_detail_gcgl="</select>";
			String result_lysx1="";
			String result_detail_lysx1="</select>";
			String result_lysx2="";
			String result_detail_lysx2="</select>";
			String result_zl1="";
			String result_detail_zl1="</select>";
			String result_zl2="";
			String result_detail_zl2="</select>";

			List<TbcntBean> sxList = BaseUtil.getAllSXList(path);
			String shbm = "";
			String sbm = "";
			String xianbm = "";
			
			String LY_one="";
			String LY_two = "";
			String LY_zone = "";
			String LY_ztwo = "";
			
			List<GclbBean> gcglList = BaseUtil.getGclbList(path);
			if("config".trim().equals(from)){
				shbm = xzqh[0].trim();
				sbm = xzqh[1].trim();
				xianbm = xzqh[2].trim();
				
				LY_one = hlxx[0].trim();
				LY_two = hlxx[1].trim();
				LY_zone = hlxx[2].trim();
				LY_ztwo = hlxx[3].trim();
				if(!"config".trim().equals(from)){
					String gclb = BuinessDao.idToNameChange(path,"TB_GCLB", "gcfldm",  "gcfldm=Mid('"+val+"',1,1)");
					if(gcglList !=null && gcglList.size()>0){
						for(int i=0;i<gcglList.size();i++){
							GclbBean bean = (GclbBean)gcglList.get(i);
							if(gclb.trim().equals(bean.getGCFLDM()))
								result_gcgl +="<option value='"+bean.getGCFLDM()+"' selected=true>"+bean.getGCFLMC().trim()+"</option>";
							else
								result_gcgl +="<option value='"+bean.getGCFLDM()+"'>"+bean.getGCFLMC().trim()+"</option>";
						}
					}
				}
			}
			else if("add".trim().equals(from)){
				shbm = cfbean.getXZQH_S();
				sbm = cfbean.getXZQH_SI();
				xianbm = cfbean.getXZQH_X();
				
				LY_one = cfbean.getLYSX_LY();
				LY_two = cfbean.getLYSX_SX();
				LY_zone = cfbean.getLYSX_YJZL();
				LY_ztwo = cfbean.getLYSX_EJZL();
			}
			else{
				shbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[0]+"'");
				sbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[1]+"'");
				xianbm = BuinessDao.idToNameChange(path,"TB_CNT", "CNTCD",  "PROVNM='"+xzqh[2]+"'");
				
				LY_one = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[0]+"'");
				LY_two = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[1]+"'");
				LY_zone = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[2]+"'");
				LY_ztwo = BuinessDao.idToNameChange(path,"tb_lysx1", "CTCD",  "CTNM='"+hlxx[3]+"'");
			}
			if(sxList !=null && sxList.size()>0){
				for(int i=0;i<sxList.size();i++){
					TbcntBean bean = (TbcntBean)sxList.get(i);
					if(shbm.trim().equals(bean.getCntcd()))
						result_z +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_z +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			if("".trim().equals(shbm))
				shbm=((TbcntBean)sxList.get(0)).getCntcd();
			List<TbcntBean> sList = BaseUtil.getAllSHList(path, shbm);				
			if(sList !=null && sList.size()>0){
				for(int i=0;i<sList.size();i++){
					TbcntBean bean = (TbcntBean)sList.get(i);
					if(sbm.trim().equals(bean.getCntcd()))
						result_s +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_s +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			if("".trim().equals(sbm))
				sbm=((TbcntBean)sList.get(0)).getCntcd();
			List<TbcntBean> xList = BaseUtil.getAllXList(path, sbm);
			if(xList !=null && xList.size()>0){
				for(int i=0;i<xList.size();i++){
					TbcntBean bean = (TbcntBean)xList.get(i);
					if(xianbm.trim().equals(bean.getCntcd()))
						result_x +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_x +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			
			List<LysxBean> lysl1List = BaseUtil.getLysxList_one(path);
			if(lysl1List !=null && lysl1List.size()>0){
				for(int i=0;i<lysl1List.size();i++){
					LysxBean bean = (LysxBean)lysl1List.get(i);
					if(LY_one.trim().equals(bean.getCTCD().trim()))
						result_lysx1 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_lysx1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			if("".trim().equals(LY_one))
				LY_one = ((LysxBean)lysl1List.get(0)).getCTCD();
			List<LysxBean> lysl2List = BaseUtil.getLysxList_two(path,LY_one);
			if(lysl2List !=null && lysl2List.size()>0){
				for(int i=0;i<lysl2List.size();i++){
					LysxBean bean = (LysxBean)lysl2List.get(i);
					if(LY_two.trim().equals(bean.getCTCD().trim()))
						result_lysx2 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_lysx2 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			if("".trim().equals(LY_two))
				LY_two = ((LysxBean)lysl2List.get(0)).getCTCD();
			List<LysxBean> zl1List = BaseUtil.getZliuList_one(path, LY_two);
			if(zl1List !=null && zl1List.size()>0){
				for(int i=0;i<zl1List.size();i++){
					LysxBean bean = (LysxBean)zl1List.get(i);
					if(LY_zone.trim().equals(bean.getCTCD().trim()))
						result_zl1 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_zl1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			if("".trim().equals(LY_zone))
				LY_zone = ((LysxBean)zl1List.get(0)).getCTCD();
			List<LysxBean> zl2List = BaseUtil.getZliuList_two(path, LY_zone);
			if(zl2List !=null && zl2List.size()>0){
				for(int i=0;i<zl2List.size();i++){
					LysxBean bean = (LysxBean)zl2List.get(i);
					if(LY_ztwo.trim().equals(bean.getCTCD().trim()))
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
		}
		if("viewload".trim().equals(type)){//查看工程信息
			String result_z=xzqh[0];
			String result_s=xzqh[1];
			String result_x=xzqh[2];
			
			String result_gcgl=BuinessDao.idToNameChange(path,"TB_GCLB", "GCFLMC",  "gcfldm=Mid('"+val+"',1,1)");;
			
			String result_lysx1=hlxx[0];
			String result_lysx2=hlxx[1];
			String result_zl1=hlxx[2];
			String result_zl2=hlxx[3];

			result=result_z+";"+result_s+";"+result_x+";"+result_gcgl+";"+result_lysx1+";"+result_lysx2+";"+result_zl1+";"+result_zl2;
		
		}
		if("change".trim().equals(type)){//处理下拉框onchange事件请求
			String changeObjName = request.getParameter("changeObjName");//确定点击行政区划请求还是流域请求
			String changeType = request.getParameter("changeType");//确定点击下拉框目标
			String changeVal = request.getParameter("changeVal");//选中的value
			if("sx".trim().equals(changeObjName)){//行政区划请求
				if("1".trim().equals(changeType)){//选择省，请求市级单位
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
					
				}else{//选择市，请求县级单位
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
			}
			if("ly".trim().equals(changeObjName)){//流域请求
				if("1".trim().equals(changeType)){//选择流域，请求下属水系信息
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
				if("2".trim().equals(changeType)){//选择水系，请求下属一级支流
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
				if("3".trim().equals(changeType)){//选择一级支流请求二级支流
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
			}
			
		}
		if("loadSearch".trim().equals(type)){//查询页面，下拉联动
			String lb = request.getParameter("lb");
			String dq = request.getParameter("dq");
			String ly = request.getParameter("ly");
			String result_gcgl="";
			String result_head_gcgl="<select name='gclb_s'><option value=''>--</option>";
			String result_detail_gcgl="</select>";
			String result_z="";
			String result_head_z="<select name='dq_s'><option value=''>--</option>";
			String result_detail_z="</select>";
			String result_lysx1="";
			String result_head_lysx1="<select name='ly_s'><option value=''>--</option>";
			String result_detail_lysx1="</select>";
			List<GclbBean> gcglList = BaseUtil.getGclbList(path);
			if(gcglList !=null && gcglList.size()>0){
				for(int i=0;i<gcglList.size();i++){
					GclbBean bean = (GclbBean)gcglList.get(i);
					if(lb.trim().equals(bean.getGCFLDM()))
						result_gcgl +="<option value='"+bean.getGCFLDM()+"' selected=true>"+bean.getGCFLMC().trim()+"</option>";
					else
						result_gcgl +="<option value='"+bean.getGCFLDM()+"'>"+bean.getGCFLMC().trim()+"</option>";
				}
			}
			List<TbcntBean> sxList = BaseUtil.getAllSXList(path);
			if(sxList !=null && sxList.size()>0){
				for(int i=0;i<sxList.size();i++){
					TbcntBean bean = (TbcntBean)sxList.get(i);
					if(dq.trim().equals(bean.getCntcd()))
						result_z +="<option value='"+bean.getCntcd()+"' selected=true>"+bean.getProvnm().trim()+"</option>";
					else
						result_z +="<option value='"+bean.getCntcd()+"'>"+bean.getProvnm().trim()+"</option>";
				}
			}
			List<LysxBean> lysl1List = BaseUtil.getLysxList_one(path);
			if(lysl1List !=null && lysl1List.size()>0){
				for(int i=0;i<lysl1List.size();i++){
					LysxBean bean = (LysxBean)lysl1List.get(i);
					if(ly.trim().equals(bean.getCTCD()))
						result_lysx1 +="<option value='"+bean.getCTCD()+"' selected=true>"+bean.getCTNM().trim()+"</option>";
					else
						result_lysx1 +="<option value='"+bean.getCTCD()+"'>"+bean.getCTNM().trim()+"</option>";
				}
			}
			
			result_gcgl=result_head_gcgl+result_gcgl+result_detail_gcgl;
			result_z=result_head_z+result_z+result_detail_z;
			result_lysx1=result_head_lysx1+result_lysx1+result_detail_lysx1;
			result = result_gcgl+";"+result_z+";"+result_lysx1;
		}
		if("uploadView".trim().equals(type)){
			String id = request.getParameter("RPJINCD");
			STDNCBean bean = BuinessDao.findStdncById(path,id);
			result = bean.getPJNO()+";"+bean.getDNCNO()+";"+bean.getXQFLDM();
		}
		if("updatepic".trim().equals(type)){
			String zlbm=request.getParameter("zlbm");
			String name=request.getParameter("name");
			name=name==null?"":name;
			String sj=request.getParameter("sj");
			String ms=request.getParameter("ms");
			ms=ms==null?"":ms;
			String TBID=request.getParameter("TBID");
			String updateSQL = "update "+TBID+" set dtcdt=#"+sj+"#,TITLE='"+name+"' ,NRMS='"+ms+"' WHERE ZLBM="+zlbm;
			BuinessDao.updateDB(updateSQL, path);
			result = "true";
		}
		if("checkIssue".trim().equals(type)){
			String ISSUE = request.getParameter("ISSUE");
			String checkResult = "";
			if(!ISSUE.trim().equals("")){
				FXJBBean bean = BuinessDao.findFxjbcByISSUE(path,ISSUE);
				if(bean==null)
					checkResult="1";
				else
					checkResult="0";
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0L);
				response.setContentType("text ml; charset=GBK");
				response.getWriter().write(checkResult);
			}
		}
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0L);
		response.setContentType("text ml; charset=GBK");
		response.getWriter().write(result);
	}
	public void init() throws ServletException {
		// Put your code here
	}
}
