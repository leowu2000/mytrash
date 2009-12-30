package com.basesoft.core;

import java.io.Serializable;

public class PageInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final int PAGESIZE = Integer.parseInt(Constants.get("PageSize", "10"));
	int curPage;
	int maxPage;
	int maxRowCount;
	int rowsPerPage;

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getMaxRowCount() {
		return maxRowCount;
	}

	public void setMaxRowCount(int maxRowCount) {
		this.maxRowCount = maxRowCount;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public PageInfo(int page, int count) {
		rowsPerPage = PAGESIZE;
		curPage = page;
		maxRowCount = count;
		maxPage = ((maxRowCount + rowsPerPage) - 1) / rowsPerPage;
	}

	public String getHtml(String servletURL) {
		return getHtml(servletURL, "listForm");
	}
	
	public String getHtml2(String servletURL) {
		return getHtml2(servletURL, "listForm");
	}
	
	public String getHtml3(String servletURL) {
		return getHtml3(servletURL, "listForm");
	}

	public String getHtml(String servletURL, String formName) {
		StringBuffer sb = new StringBuffer();
		String inlineJS = "<script type='text/javascript'>function submitTo(url,formName){var sForm=document.getElementById(formName);sForm.action=url;sForm.submit();}</script>";
		sb.append(inlineJS);
		sb.append("<span class=\"fountblack14\">");
		sb.append("共" + maxRowCount + "条" + maxPage + "页，" + rowsPerPage + "条/页；当前页：<strong>" + curPage
				+ "</strong></span><span class=\"fountblack14\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		if (curPage > 1) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=1','" + formName + "');\" >首页</A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage - 1) + "','" + formName
					+ "');\" >上页</A>&nbsp;");
		} else {
			sb.append("首页&nbsp;");
			sb.append("上页&nbsp;");
		}
		if (curPage < maxPage) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage + 1) + "','" + formName
					+ "');\" >下页</A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + maxPage + "','" + formName
					+ "');\" >尾页</A>&nbsp;");
		} else {
			sb.append("下页&nbsp;");
			sb.append("尾页&nbsp;");
		}
		sb.append("转到");
		sb.append("<select id=\"page\" name=\"page\" class=\"TextStyle\" onchange=\"javascript:submitTo('" + servletURL
				+ "&page='+document.getElementById('page').value,'" + formName + "')\" >");
		sb.append(getPageOptions(maxPage, curPage) + "</select></span>");
		return sb.toString();
	}
	
	public String getHtml2(String servletURL, String formName) {
		StringBuffer sb = new StringBuffer();
		String inlineJS = "<script type='text/javascript'>function submitTo(url,formName){var sForm=document.getElementById(formName);sForm.action=url;sForm.submit();}</script>";
		sb.append(inlineJS);
		sb.append("&nbsp;&nbsp;&nbsp;<span  class='fountblack14'>共" + maxRowCount + "条" + maxPage + "页，" + rowsPerPage + "条/页；当前页：" + curPage
				+ "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		if (curPage > 1) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=1','" + formName + "');\" ><span class='fount14c'>首页<span></A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage - 1) + "','" + formName
					+ "');\" ><span class='fount14c'>上页</span></A>&nbsp;");
		} else {
			sb.append("<span  class='fountblack14'>首页</span>&nbsp;");
			sb.append("<span  class='fountblack14'>上页</span>&nbsp;");
		}
		if (curPage < maxPage) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage + 1) + "','" + formName
					+ "');\" ><span class='fount14c'>下页</span></A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + maxPage + "','" + formName
					+ "');\" ><span class='fount14c'>尾页</span></A>&nbsp;");
		} else {
			sb.append("<span  class='fountblack14'>下页</span>&nbsp;");
			sb.append("<span  class='fountblack14'>尾页</span>&nbsp;");
		}
		sb.append("<span  class='fountblack14'>转到</span>");
		sb.append("<select id=\"page\" name=\"page\"  class='fountblack14' onchange=\"javascript:submitTo('" + servletURL
				+ "&page='+document.getElementById('page').value,'" + formName + "')\" >");
		sb.append(getPageOptions(maxPage, curPage) + "</select>");
		return sb.toString();
	}
	
	//用于首页填报别表的分页条
	public String getHtml3(String servletURL, String formName) {
		rowsPerPage = 40;
		maxPage = ((maxRowCount + rowsPerPage) - 1) / rowsPerPage;
		
		StringBuffer sb = new StringBuffer();
		String inlineJS = "<script type='text/javascript'>function submitTo(url,formName){var sForm=document.getElementById(formName);sForm.action=url;sForm.submit();}</script>";
		sb.append(inlineJS);
		sb.append("&nbsp;&nbsp;&nbsp;<span  class='fountblack14'>共" + maxRowCount + "条" + maxPage + "页，" + rowsPerPage + "条/页；当前页：" + curPage
				+ "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		if (curPage > 1) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=1','" + formName + "');\" ><span class='fount14c'>首页<span></A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage - 1) + "','" + formName
					+ "');\" ><span class='fount14c'>上页</span></A>&nbsp;");
		} else {
			sb.append("<span  class='fountblack14'>首页</span>&nbsp;");
			sb.append("<span  class='fountblack14'>上页</span>&nbsp;");
		}
		if (curPage < maxPage) {
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + (curPage + 1) + "','" + formName
					+ "');\" ><span class='fount14c'>下页</span></A>&nbsp;");
			sb.append("<A HREF=\"javascript:submitTo('" + servletURL + "&page=" + maxPage + "','" + formName
					+ "');\" ><span class='fount14c'>尾页</span></A>&nbsp;");
		} else {
			sb.append("<span  class='fountblack14'>下页</span>&nbsp;");
			sb.append("<span  class='fountblack14'>尾页</span>&nbsp;");
		}
		sb.append("<span  class='fountblack14'>转到</span>");
		sb.append("<select id=\"page\" name=\"page\"  class='fountblack14' onchange=\"javascript:submitTo('" + servletURL
				+ "&page='+document.getElementById('page').value,'" + formName + "')\" >");
		sb.append(getPageOptions(maxPage, curPage) + "</select>");
		return sb.toString();
	}

	private String getPageOptions(int maxPage, int curPage) {
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i <= maxPage; i++)
			sb.append("<option value='" + i + "' " + (i == curPage ? "selected" : "") + "><span  class='fountblack14'>第" + i + "页</span></option>");
		return sb.toString();
	}
}
