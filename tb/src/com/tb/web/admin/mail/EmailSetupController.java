package com.tb.web.admin.mail;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.common.Constant;
import com.tb.common.MailBox;
import com.tb.service.UserService;
import com.tb.test.Driver;
import com.tb.domain.User;

@Controller
@RequestMapping("/admin/email.html")
public class EmailSetupController {

	private int configMailBox(String server, int port, String account,
			String password, String toAddress) {
		int ok = 1;
		int error = -1;

		String filepath = EmailSetupController.class
				.getResource("/config/mailbox.properties").getFile().toString();
		Properties prop = new Properties();
		OutputStream output = null;

		try {

			output = new FileOutputStream(filepath);
			prop.setProperty("server", server);
			prop.setProperty("port", Integer.toString(port));
			prop.setProperty("account", account);
			prop.setProperty("password", password);
			prop.setProperty("toAddress", toAddress);
			prop.store(output, null);

		} catch (IOException io) {
			io.printStackTrace();
			return error;
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
					return error;
				}
			}

		}
		return ok;
	}

	private int getMailBoxConfig(MailBox mailbox) {
		int ok = 1;
		int error = -1;

		String filepath = EmailSetupController.class
				.getResource("/config/mailbox.properties").getFile().toString();
		Properties prop = new Properties();
		InputStream input = null;

		try {

			input = new FileInputStream(filepath);

			// load a properties file
			prop.load(input);

			// get the property value and print it out
			mailbox.setServer(prop.getProperty("server"));
			mailbox.setPort(Integer.parseInt(prop.getProperty("port")));
			mailbox.setAccount(prop.getProperty("account"));
			mailbox.setPassword(prop.getProperty("password"));
			mailbox.setToAddress(prop.getProperty("toAddress"));

		} catch (IOException io) {
			io.printStackTrace();
			return error;
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
					return error;
				}
			}

		}
		return ok;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showLoginPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MailBox mailbox = new MailBox();
		if (getMailBoxConfig(mailbox) == -1) {
			return null;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mailbox", mailbox);
		return new ModelAndView("admin/email", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView handlerMailbox(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		int port = 25;
		String server = request.getParameter("server");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String toAddress = request.getParameter("toAddress");
		PrintWriter out = response.getWriter();

		try {
			port = Integer.parseInt(request.getParameter("port"));
		} catch (Exception e) {
			out.print("portError");
			return null;
		}
		if (server != null && !"".equals(server.trim()) && port > 0
				&& account != null && !"".equals(account.trim())
				&& password != null && !"".equals(password)
				&& toAddress != null && !"".equals(toAddress.trim())) {
			System.out.println(server);
			System.out.println(port);
			System.out.println(account);
			System.out.println(password);
			System.out.println(toAddress);
			System.out.println("-----------------");
			if (configMailBox(server, port, account, password, toAddress) < 0) {
				out.print("error");
				return null;
			}
			out.print("pass");
		} else {
			out.print("error");
		}
		return null;
	}

}
