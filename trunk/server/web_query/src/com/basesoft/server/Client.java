package com.basesoft.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {

	public static void main(String[] args) {
		Client c = new Client();
		try {
			c.send("d:/aaa.zip");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void send(String string) throws UnknownHostException, IOException {
		Socket server = new Socket(InetAddress.getLocalHost(), 9292);
		BufferedReader in = new BufferedReader(new InputStreamReader(server
				.getInputStream()));
		PrintWriter out = new PrintWriter(server.getOutputStream());
		// 标准输入
		BufferedReader wt = new BufferedReader(new InputStreamReader(System.in));
		while (true) {
			String str = wt.readLine();
			out.println(str);
			out.flush();
			if (str.equals("end")) {
				break;
			}
			System.out.println(in.readLine());
		}
		server.close();
	}

}
