package com.basesoft.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server extends ServerFrame {
	public Server() {
		ServerSocket rServer = null;
		Socket request = null;
		Thread receiveThread = null;
		try {
			int default_port = Integer.parseInt(DefaultSetting.getPort().trim());
			rServer = new ServerSocket(default_port);
			System.out.println("The server is ready!Port: " + default_port);
			super.ServerListPort("欢迎使用实时工情数据接收服务");
			super.ServerListPort("服务已经开始!!端口：" + default_port);
			System.out.println("Thread number: " + super.ConnectNum);
			while (true) {
				request = rServer.accept();
				System.out.println("sock is connected");
				receiveThread = new ServerThread(this, request);
				receiveThread.start();
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

	public static void main(String args[]) {
		new Server();
	}
}