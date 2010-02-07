package com.basesoft.server;
/**
 * 在此处插入类型说明。
 * 创建日期：(2001-9-17 16:09:28)
 * @author：Administrator
 */
import java.awt.Component;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ServerFrame implements ActionListener{
	public int ConnectNum=0;//全程变量计数器
	private java.awt.Panel ivjContentsPane = null;
	private java.awt.List ivjclientList = null;
	private java.awt.Menu ivjMenuControl = null;
	private java.awt.Menu ivjMenuHelp = null;
	private java.awt.MenuItem ivjMenuItemAbout = null;
	private java.awt.MenuItem ivjMenuItemError = null;
	private java.awt.MenuItem ivjMenuItemExit = null;
	private java.awt.MenuItem ivjMenuItemIndex = null;
	private java.awt.MenuItem ivjMenuItemLog = null;
	private java.awt.MenuItem ivjMenuItemOpen = null;
	private java.awt.Menu ivjMenuLog = null;
	private java.awt.List ivjserverList = null;
	private java.awt.Frame ivjServerMyFrame = null;
	private java.awt.MenuBar ivjServerMyFrameMenuBar = null;
	
	
public ServerFrame() {
	initialize();
}
/**
 * 返回 List1 特性值。
 * @return java.awt.List
 */
/* 警告：此方法将重新生成。 */
private java.awt.List getclientList() {
	if (ivjclientList == null) {
		try {
			ivjclientList = new java.awt.List(10,true);
			ivjclientList.setName("clientList");
			ivjclientList.setBounds(0, 2, 200, 280);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjclientList;
}
/**
 * 返回 ContentsPane 特性值。
 * @return java.awt.Panel
 */
/* 警告：此方法将重新生成。 */
private java.awt.Panel getContentsPane() {
	if (ivjContentsPane == null) {
		try {
			ivjContentsPane = new java.awt.Panel();
			ivjContentsPane.setName("ContentsPane");
			ivjContentsPane.setLayout(null);
			getContentsPane().add(getclientList(), getclientList().getName());
			getContentsPane().add(getserverList(), getserverList().getName());
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjContentsPane;
}
/**
 * 返回 Menu1 特性值。
 * @return java.awt.Menu
 */
/* 警告：此方法将重新生成。 */
private java.awt.Menu getMenuControl() {
	if (ivjMenuControl == null) {
		try {
			ivjMenuControl = new java.awt.Menu();
			ivjMenuControl.setActionCommand("ActMenuControl");
			ivjMenuControl.setLabel("控制");
			ivjMenuControl.add(getMenuItemOpen());
			ivjMenuControl.add(getMenuItemExit());
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuControl;
}
/**
 * 返回 Menu3 特性值。
 * @return java.awt.Menu
 */
/* 警告：此方法将重新生成。 */
private java.awt.Menu getMenuHelp() {
	if (ivjMenuHelp == null) {
		try {
			ivjMenuHelp = new java.awt.Menu();
			ivjMenuHelp.setLabel("帮助");
			ivjMenuHelp.add(getMenuItemIndex());
			ivjMenuHelp.add(getMenuItemAbout());
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuHelp;
}
/**
 * 返回 MenuItemAbout 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemAbout() {
	if (ivjMenuItemAbout == null) {
		try {
			ivjMenuItemAbout = new java.awt.MenuItem();
			ivjMenuItemAbout.setActionCommand("HelpAbout");
			ivjMenuItemAbout.setLabel("关于");
			ivjMenuItemAbout.addActionListener(this);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemAbout;
}
/**
 * 返回 MenuItemError 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemError() {
	if (ivjMenuItemError == null) {
		try {
			ivjMenuItemError = new java.awt.MenuItem();
			ivjMenuItemError.setActionCommand("ErrorLog");
			ivjMenuItemError.setLabel(" 清空窗口日志");
			ivjMenuItemError.addActionListener(this);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemError;
}
/**
 * 返回 MenuItemExit 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemExit() {
	if (ivjMenuItemExit == null) {
		try {
			ivjMenuItemExit = new java.awt.MenuItem();
			ivjMenuItemExit.setActionCommand("ExitServer");
			ivjMenuItemExit.setLabel("退出");
			ivjMenuItemExit.addActionListener(this);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemExit;
}
/**
 * 返回 MenuItemIndex 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemIndex() {
	if (ivjMenuItemIndex == null) {
		try {
			ivjMenuItemIndex = new java.awt.MenuItem();
			ivjMenuItemIndex.setActionCommand("HelpIndex");
			ivjMenuItemIndex.setLabel("帮助主页");
			ivjMenuItemIndex.addActionListener(this);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemIndex;
}
/**
 * 返回 MenuItemLog 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemLog() {
	if (ivjMenuItemLog == null) {
		try {
			ivjMenuItemLog = new java.awt.MenuItem();
			ivjMenuItemLog.setActionCommand("LookLog");
			ivjMenuItemLog.setLabel("查看日志");
			ivjMenuItemLog.addActionListener(this);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemLog;
}
/**
 * 返回 MenuItemOpen 特性值。
 * @return java.awt.MenuItem
 */
/* 警告：此方法将重新生成。 */
private java.awt.MenuItem getMenuItemOpen() {
	if (ivjMenuItemOpen == null) {
		try {
			ivjMenuItemOpen = new java.awt.MenuItem();
			ivjMenuItemOpen.setActionCommand("OpenServer");
			ivjMenuItemOpen.setLabel("启动");
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuItemOpen;
}
/**
 * 返回 Menu2 特性值。
 * @return java.awt.Menu
 */
/* 警告：此方法将重新生成。 */
private java.awt.Menu getMenuLog() {
	if (ivjMenuLog == null) {
		try {
			ivjMenuLog = new java.awt.Menu();
			ivjMenuLog.setLabel("日志");
			ivjMenuLog.add(getMenuItemLog());
			ivjMenuLog.add(getMenuItemError());
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjMenuLog;
}
/**
 * 返回 List2 特性值。
 * @return java.awt.List
 */
/* 警告：此方法将重新生成。 */
private java.awt.List getserverList() {
	if (ivjserverList == null) {
		try {
			ivjserverList = new java.awt.List(10,true);
			ivjserverList.setName("serverList");
			ivjserverList.setBounds(200, 2, 340, 280);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjserverList;
}
/**
 * 返回 Frame1 特性值。
 * @return java.awt.Frame
 */
/* 警告：此方法将重新生成。 */
private java.awt.Frame getServerMyFrame() {
	if (ivjServerMyFrame == null) {
		try {
			ivjServerMyFrame = new java.awt.Frame();
			ivjServerMyFrame.setTitle("实时工情数据接收服务");
			ivjServerMyFrame.setName("ServerMyFrame");
			ivjServerMyFrame.setMenuBar(getServerMyFrameMenuBar());
			ivjServerMyFrame.setLayout(new java.awt.BorderLayout());
			ivjServerMyFrame.setBounds(35, 43, 540, 300);
			getServerMyFrame().add(getContentsPane(), "Center");
			center(ivjServerMyFrame);
			ivjServerMyFrame.setVisible(true);
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjServerMyFrame;
}

/**
 * 返回 ServerMyFrameMenuBar 特性值。
 * @return java.awt.MenuBar
 */
private java.awt.MenuBar getServerMyFrameMenuBar() {
	if (ivjServerMyFrameMenuBar == null) {
		try {
			ivjServerMyFrameMenuBar = new java.awt.MenuBar();
			ivjServerMyFrameMenuBar.add(getMenuControl());
			ivjServerMyFrameMenuBar.add(getMenuLog());
			ivjServerMyFrameMenuBar.add(getMenuHelp());
		} catch (java.lang.Throwable ivjExc) {
			handleException(ivjExc);
		}
	}
	return ivjServerMyFrameMenuBar;
}
/**
 * 每当部件抛出异常时被调用
 * @param exception java.lang.Throwable
 */
private void handleException(java.lang.Throwable exception) {

	/* 除去下列各行的注释，以将未捕捉到的异常打印至 stdout。 */
	// System.out.println("--------- 未捕捉到的异常 ---------");
	// exception.printStackTrace(System.out);
}
/**
 * 初始化类。
 */
/* 警告：此方法将重新生成。 */
private void initialize() {
	try {
		getServerMyFrame();
	} catch (java.lang.Throwable ivjExc) {
		handleException(ivjExc);
	}
}
public void actionPerformed(ActionEvent event){
	String arg=event.getActionCommand();
	System.out.println(arg);
	if(arg.equals("HelpAbout")){
		//String message=new String("这是网络传输服务端,Copy Right kingbase。时间：2001-9-18");
		String title=new String("关于");
		Dialog MessageDialog=new DialogBase(ivjServerMyFrame,title, "yes", null, null);
		MessageDialog.setVisible(true);
	}
	else if(arg.equals("LookLog")){
		String title=new String("查看日志");
		String fileName=new String("人大金仓发送日志文件.log");
		Dialog mDialog=new MessageDialog(ivjServerMyFrame,title,null, null,500,400,fileName);
		mDialog.setVisible(true);
	}
	
	else if(arg.equals("ExitServer")){
		System.exit(0);
	}
	else if(arg.equals("ErrorLog")){
		ServerListClear();
	}
	else if(arg.equals("HelpIndex")){
		String s="cmd /c start ./myliuWorK.chm";
		try
		{
			Runtime.getRuntime().exec(s);
		}
		catch(Exception e){
			 System.out.println("不能打开帮助："+e.getMessage());
		}
	}
	
}
public void ServerListPort(String info){
	ivjclientList.add(info);	
}
public void ServerListPort(String info,int index){
	ivjclientList.add(info,index);	
}
public void ServerListRemove(int index){
	ivjclientList.remove(index);	
}
public void ServerListClear(){
	ivjserverList.removeAll();
}
public void center(Component C) {
     Dimension SS = C.getToolkit().getScreenSize();
     Dimension CS = C.getSize();
     C.setLocation ((SS.width - CS.width) / 2,(SS.height - CS.height) / 2);
}
/**
 * 主入口点 - 当部件作为应用程序运行时，启动这个部件。
 * @param args java.lang.String[]
 */
/*public static void main(java.lang.String[] args) {
	try {
		ServerFrame aServerFrame;
		aServerFrame = new ServerFrame();
	} catch (Throwable exception) {
		System.err.println("java.lang.Object 的 main() 中发生异常");
		exception.printStackTrace(System.out);
	}
}*/
}
