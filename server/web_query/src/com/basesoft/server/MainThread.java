package com.basesoft.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;

public class MainThread extends Thread {
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
