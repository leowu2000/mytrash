package com.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OutputLog {
    public static void outputLog(String saveDir, String msg) {
        try {
            File files = new File(saveDir + "\\sys\\syslog.txt");
            FileWriter fw = null;
            if (files.exists()) {
                fw = new FileWriter(saveDir + "\\sys\\syslog.txt", true);
            } else {
                fw = new FileWriter(saveDir + "\\sys\\syslog.txt");
            }
            fw.write(msg + "\r\n");
            fw.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public static List<String> readData(String filepath) {
        List<String> values = new ArrayList<String>();
        try {
            FileReader read = new FileReader(filepath);
            BufferedReader br = new BufferedReader(read);
            String row;
            while ((row = br.readLine()) != null) {
                values.add(row);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
       return values;
    }
}
