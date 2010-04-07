package com.mmstart.bsclient;

import org.mortbay.jetty.Server;
import org.mortbay.xml.XmlConfiguration;
import org.xml.sax.SAXException;

import java.awt.*;
import java.awt.event.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class MainServer implements ActionListener, MouseListener {
    Image icon16, icon24;
    Frame frame;
    Button btnOpen;
    int port = 9999;

    public static void main(String[] args) {
        MainServer server = new MainServer();
        server.startServer();
        server.startWindow();
        server.openBrowser();
    }

    private void startWindow() {
        if (!GraphicsEnvironment.isHeadless()) {
            try {
                icon16 = Toolkit.getDefaultToolkit().getImage(MainServer.class.getResource("/com/mmstart/bsclient/res/bsclient.png"));
                icon24 = Toolkit.getDefaultToolkit().getImage(MainServer.class.getResource("/com/mmstart/bsclient/res/bsclient24.png"));
                if (!createTrayIcon()) {
                    showWindow(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void openBrowser() {
        try {
            URI uri = new URI("http://localhost:" + port);
            Desktop desktop = Desktop.getDesktop();
            desktop.browse(uri);
        }
        catch (NoClassDefFoundError e) {                       // java.awt.Desktop is only available since Java 1.6
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }

    private void startServer() {
//        String jetty_default = new java.io.File("./start.jar").exists() ? "." : "../..";
//        String jetty_home = System.getProperty("jetty.home", jetty_default);
        Server server = new Server();
//        Connector connector = new SelectChannelConnector();
//        connector.setPort(Integer.getInteger("jetty.port", 9999).intValue());
//        server.setConnectors(new Connector[]{connector});
//
//        WebAppContext webapp = new WebAppContext();
//        webapp.setContextPath("/");
////        webapp.setWar(jetty_home + "/webapps/test");
//        webapp.setWar("U:\\IdeaProjects\\swdb\\out\\artifacts\\swdb");
//        webapp.setDefaultsDescriptor(jetty_home + "/etc/webdefault.xml");
//        server.setHandler(webapp);
//        try {
//            server.start();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        try {
            XmlConfiguration configuration = new XmlConfiguration(new FileInputStream("./jetty-webapp.xml"));
            configuration.configure(server);
            port = server.getConnectors()[0].getPort();
            server.start();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean createTrayIcon() {
        //此方法使用动态调用方法是为了兼容JDK1.4等老版本环境
        try {
            // SystemTray.isSupported();
            Boolean supported = (Boolean) Class.forName("java.awt.SystemTray").getMethod("isSupported").invoke(null);
            if (!supported)
                return false;

            PopupMenu menuConsole = new PopupMenu();

            MenuItem itemConsole = new MenuItem("打开信息采集系统");
            itemConsole.setActionCommand("console");
            itemConsole.addActionListener(this);
            menuConsole.add(itemConsole);


            MenuItem itemStatus = new MenuItem("系统状态");
            itemStatus.setActionCommand("status");
            itemStatus.addActionListener(this);
            menuConsole.add(itemStatus);

            MenuItem itemExit = new MenuItem("退出系统");
            itemExit.setActionCommand("exit");
            itemExit.addActionListener(this);
            menuConsole.add(itemExit);

            // SystemTray tray = SystemTray.getSystemTray();
            Object tray = Class.forName("java.awt.SystemTray").getMethod("getSystemTray").invoke(null);
            // Dimension d = tray.getTrayIconSize();
            Dimension d = (Dimension) Class.forName("java.awt.SystemTray").getMethod("getTrayIconSize").invoke(tray);
            Image icon = (d.width >= 24 && d.height >= 24) ? icon24 : icon16;
            // TrayIcon icon = new TrayIcon(image, "H2 Database Engine", menuConsole);
            Object trayIcon = Class.forName("java.awt.TrayIcon").getConstructor(Image.class, String.class, PopupMenu.class).newInstance(icon, "防汛抗旱信息采集系统", menuConsole);
            // trayIcon.addMouseListener(this);
            trayIcon.getClass().getMethod("addMouseListener", MouseListener.class).invoke(trayIcon, this);
            // tray.add(icon);
            tray.getClass().getMethod("add", Class.forName("java.awt.TrayIcon")).invoke(tray, trayIcon);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void showWindow(final boolean exit) {
        frame = new Frame("应用系统状态");
        frame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent we) {
                if (exit)
                    stopAll();
                else
                    frame.dispose();
            }
        });
        if (icon16 != null)
            frame.setIconImage(icon16);
        frame.setResizable(false);
        frame.setLayout(new GridBagLayout());

        // the main panel keeps everything together
        Panel mainPanel = new Panel(new GridBagLayout());

        GridBagConstraints constraintsPanel = new GridBagConstraints();
        constraintsPanel.gridx = 0;
        constraintsPanel.weightx = 1.0D;
        constraintsPanel.weighty = 1.0D;
        constraintsPanel.fill = GridBagConstraints.BOTH;
        constraintsPanel.insets = new Insets(0, 10, 0, 10);
        constraintsPanel.gridy = 0;

        GridBagConstraints constraintsButton = new GridBagConstraints();
        constraintsButton.gridx = 0;
        constraintsButton.gridwidth = 2;
        constraintsButton.insets = new Insets(10, 0, 0, 0);
        constraintsButton.gridy = 1;
        constraintsButton.anchor = GridBagConstraints.EAST;

        GridBagConstraints constraintsTextField = new GridBagConstraints();
        constraintsTextField.fill = GridBagConstraints.HORIZONTAL;
        constraintsTextField.gridy = 0;
        constraintsTextField.weightx = 1.0;
        constraintsTextField.insets = new Insets(0, 5, 0, 0);
        constraintsTextField.gridx = 1;

        GridBagConstraints constraintsLabel = new GridBagConstraints();
        constraintsLabel.gridx = 0;
        constraintsLabel.gridy = 0;

        Label label = new Label("系统访问地址:", Label.LEFT);
        mainPanel.add(label, constraintsLabel);

        TextField text = new TextField();
        text.setEditable(false);
        text.setText("http://localhost:" + port);
        text.setFocusable(false);
        mainPanel.add(text, constraintsTextField);

        btnOpen = new Button("打开");
        btnOpen.setFocusable(false);
        btnOpen.setActionCommand("console");
        btnOpen.addActionListener(this);
        mainPanel.add(btnOpen, constraintsButton);
        frame.add(mainPanel, constraintsPanel);

        int width = 300, height = 120;
        frame.setSize(width, height);
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        frame.setLocation((screenSize.width - width) / 2, (screenSize.height - height) / 2);
        try {
            frame.setVisible(true);
        } catch (Throwable t) {
            // some systems don't support this method, for example IKVM however it still works
        }
    }

    private void stopAll() {
        if (frame != null) {
            frame.dispose();
            frame = null;
        }
        System.exit(0);
    }

    public void actionPerformed(ActionEvent actionEvent) {
        String command = actionEvent.getActionCommand();
        if ("exit".equals(command)) {
            stopAll();
        } else if ("console".equals(command)) {
            openBrowser();
        } else if ("status".equals(command)) {
            showWindow(false);
        } else if (btnOpen == actionEvent.getSource()) {
            openBrowser();    // for some reason, IKVM ignores setActionCommand
        }
    }

    public void mouseClicked(MouseEvent mouseEvent) {
        if (mouseEvent.getButton() == MouseEvent.BUTTON1) {
            openBrowser();
        }
    }

    public void mousePressed(MouseEvent mouseEvent) {
    }

    public void mouseReleased(MouseEvent mouseEvent) {
    }

    public void mouseEntered(MouseEvent mouseEvent) {
    }

    public void mouseExited(MouseEvent mouseEvent) {
    }
}