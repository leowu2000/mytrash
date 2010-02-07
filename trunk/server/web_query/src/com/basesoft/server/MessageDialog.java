package com.basesoft.server;
import java.awt.Button;
import java.awt.Component;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Event;
import java.awt.Frame;
import java.awt.Panel;
import java.awt.Point;
import java.awt.TextArea;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

@SuppressWarnings("serial")
public class MessageDialog extends Dialog {
	Button yes=null,cancel=null;
	public static final int YES = 1;
    	public static final int CANCEL = -1;
    	public static final int SCROLLBARS_VERTICAL_ONLY=1;
    	
    	public int screenres;
    	public Dimension screensize;
    	public int screenwidth;
    	public int screenheight;
    	public static Point screencenter;
    	
	public MessageDialog(Frame parent,String ntitle,String yesinfo,String noinfo,int x,int y ,String strFileName){
		super(parent,ntitle,true);
		String info="";
		BufferedReader bufRead;
		//ScrollPane p=new ScrollPane();
		Panel p=new Panel();
		try{
			//File fLog =new File("人大金仓发送日志文件.log");
			File fLog =new File(strFileName);
			FileReader fLogRead=new FileReader(fLog);
			bufRead=new BufferedReader(fLogRead);
			while(bufRead.readLine()!=null){
				info+=bufRead.readLine()+"\n";
			}
			bufRead.close();	
		}
		
		catch(IOException e){
			System.out.print("不能写入文件"+e.getMessage());
		}
		
		if(yesinfo!=null){
			yes=new Button("确定");
			p.add("South",yes);
		}
		if(noinfo!=null){
			cancel=new Button("取消");
			p.add("South",cancel);
		}
		TextArea txtInfo=new TextArea(info,22,65,SCROLLBARS_VERTICAL_ONLY);
		txtInfo.append(info);
		p.add(txtInfo);
		add(p);
		setSize(x,y);
		getScreen(parent);
		movetocenter(500,400);
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
            		case CANCEL: cancel(); break;
        	}
    	}
	protected void yes() {System.exit(0);}
    	protected void cancel() {System.exit(0);}
}
