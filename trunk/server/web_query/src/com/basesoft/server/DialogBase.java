package com.basesoft.server;
/**
 * 在此处插入类型说明。
 * 创建日期：(2001-9-18 9:42:44)
 * @author：Administrator
 */
 import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Component;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Event;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.Panel;
import java.awt.Point;
import java.awt.Toolkit;
 
@SuppressWarnings("serial")
public class DialogBase extends Dialog{
	Panel p;
	Button yes=null,no=null,cancel=null;
	public static final int NO = 0;
    	public static final int YES = 1;
    	public static final int CANCEL = -1;
	Label labMessage;
	
	public int screenres;
    	public Dimension screensize;
    	public int screenwidth;
    	public int screenheight;
    	public static Point screencenter;
    	
	public DialogBase(Frame parent,String title,String yes_label,String no_label,String cancel_label){
		super(parent,title,false);
		this.setLayout(new BorderLayout(10, 10));
		p=new Panel();
		p.setLayout(new FlowLayout(FlowLayout.CENTER, 35, 8));
		//p.setFont(new Font("Helvetica", Font.PLAIN, 11));
		labMessage=new Label("国家防汛指挥系统实时工情数据接收服务");
		p.add(labMessage);
		labMessage.setBounds(35, 43, 500, 300);
		Label labcompa=new Label("开发单位:北京人大金仓信息技术有限公司");
		labcompa.setBounds(40,50,500,300);
		p.add(labcompa);
		Label labAuthor=new Label("公司主页: htt://www.kingbase.com.cn");
		labAuthor.setBounds(45,57,500,300);
		p.add(labAuthor);
		Label labVersion=new Label("软件版本1.3    2001年10月");
		labVersion.setBounds(50,57,500,300);
		p.add(labVersion);
		if(yes_label!=null){
			yes=new Button("确定");
			yes.setBounds(55,57,500,300);
			p.add("South",yes);
		}
		if(no_label!=null){
			no=new Button("否认");
			p.add("South",no);
		}
		if(cancel_label!=null){
			cancel=new Button("取消");
			p.add("South",cancel);
		}
		//p.setBounds(35, 43, 500, 300);
		p.setBounds(100, 200, 500, 300);
		add(p);
		setSize(300,200);
		getScreen(parent);
		movetocenter(300,200);		
	}
	private void getScreen(Frame parent) {
        	Toolkit kit = parent.getToolkit();
        	screenres = kit.getScreenResolution();
        	screensize = kit.getScreenSize();
        	screenwidth = screensize.width;
        	screenheight = screensize.height;
        	screencenter = new Point(screensize.width/2, screensize.height/2);
    	}
	public void movetocenter(int winwidth, int winheight) {
        	Point wincenter = new Point(winwidth/2, winheight/2);
        	int move_x = screencenter.x - wincenter.x;
        	int move_y = screencenter.y - wincenter.y;
        	this.setLocation(move_x, move_y); //call the Component's move method
    	}

    	public static void movetocenter(Component c, int winwidth, int winheight) {
        	Point wincenter = new Point(winwidth/2, winheight/2);
        	int move_x = screencenter.x - wincenter.x;
        	int move_y = screencenter.y - wincenter.y;
        	c.setLocation(move_x, move_y); //call the Component's move method
    	}
	
	public boolean handleEvent(Event e){
		if(e.id == Event.ACTION_EVENT) {
            		if (e.target instanceof Button) {
                	if (e.target == yes) answer(YES);
                	else if (e.target == no) answer(NO);
                	else answer(CANCEL);
            		}
            		return true;
        	}
        	else if (e.id == Event.WINDOW_DESTROY) {
            		this.setVisible(false);
            		this.dispose();
            		return true;
        	}
        	return true;
	}
	protected void answer(int answer) {
        	switch(answer) {
            		case YES: yes(); break;
            		case NO:  no(); break;
            		case CANCEL: cancel(); break;
        	}
    	}
	protected void yes() {dispose();}
    	protected void no() {dispose();}
    	protected void cancel() {System.exit(0);}
}
