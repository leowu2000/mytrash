package com.basesoft.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;

public class MainThread extends Thread{
	@Override
	public void run() {
		ServerSocket rServer = null;
		Socket request = null;
		Thread receiveThread = null;
		try {
			Properties p = new Properties();
			p.load(this.getClass().getResourceAsStream("/config.properties"));
			int default_port = Integer.parseInt(p.getProperty("Port"));
			rServer = new ServerSocket(default_port);
			System.out.println("The server is ready!Port: " + default_port);
//super.ServerListPort("欢迎使用实时工情数据接收服务");
//super.ServerListPort("服务已经开始!!端口：" + default_port);
//System.out.println("Thread number: " + super.ConnectNum);
			while (true) {
				request = rServer.accept();
				System.out.println("sock is connected");
				receiveThread = new ServerThread(request);
				receiveThread.start();
				try {
					sleep(5000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			try {
				rServer.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

}
