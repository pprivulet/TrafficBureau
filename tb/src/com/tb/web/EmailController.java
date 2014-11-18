package com.tb.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.common.MailBox;
import com.tb.domain.Mail;
import com.tb.service.EntryService;
import com.tb.service.MailService;
import com.tb.web.admin.mail.EmailSetupController;

@Controller
@RequestMapping("/email.html")
public class EmailController {

	@Autowired
	private MailService mailService;
	
	
	private void sendMail(MailBox mailbox, String messageTitle,
			String messageBody) {
		final String username = mailbox.getAccount();
		final String password = mailbox.getPassword();		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", mailbox.getServer());
		props.put("mail.smtp.port", mailbox.getPort());
		//props.put("mail.smtp.connectiontimeout", 10000);
		//props.put("mail.smtp.timeout", 10000);

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mailbox.getToAddress()));
			// Set Subject: header field
			message.setSubject(messageTitle);

			// Create the message part

			message.setText(messageBody);

			// Fill the message

			// Create a multipar message
			// Multipart multipart = new MimeMultipart();

			// Set text message part
			// multipart.addBodyPart(messageBodyPart);

			// Part two is attachment
			// messageBodyPart = new MimeBodyPart();
			// String filename = "demo.txt";
			// DataSource source = new FileDataSource(filename);
			// messageBodyPart.setDataHandler(new DataHandler(source));
			// messageBodyPart.setFileName(filename);
			// multipart.addBodyPart(messageBodyPart);

			// Send the complete message parts
			// message.setContent(multipart);

			// Send message
			System.out.println("Sending....");
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException e) {
			System.out.println(e);
			throw new RuntimeException(e);
		}
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
			//System.out.println(mailbox);

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

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String place = request.getParameter("place");
		String road = request.getParameter("road");
		String area = request.getParameter("area");
		String job = request.getParameter("job");
		String title = request.getParameter("title");
		int type = Integer.parseInt(request.getParameter("type"));
		String content = request.getParameter("content");
		String msgName = "姓名:" + name + "\n";
		String msgPhone = "电话:" + phone + "\n";
		String msgEmail = "邮箱:" + email + "\n";
		String msgLocation = "地址:" + city + place + road + area + "\n";
		String msgJob = "职业:" + job + "\n";
		String msgType = "类型:" + type + "\n";
		String msgContent = "内容:" + content + "\n";

		if (name.length() == 0 || phone.length() == 0 || email.length() == 0
				|| area.length() == 0 || title.length() == 0
				|| content.length() == 0) {
			out.print("error");
			return null;
		} 
		
		
		if (name.length() > 16 || phone.length() > 16 || email.length() > 64
				|| area.length() > 128 || title.length() > 128
				|| content.length() > 1024) {
			out.print("error");
			return null;
		} 
		String messageBody = msgName + msgPhone + msgEmail + msgLocation
				+ msgJob + msgType + msgContent;
		String messageTitle = title;

		MailBox mailbox = new MailBox();
		if (getMailBoxConfig(mailbox) == -1) {
			out.write("error");
			return null;
		}
		out.write("pass");
		
		Mail mail = new Mail();		
		mail.setAddress(city + place + road + area);
		mail.setContent(content);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String created = df.format(now);
		mail.setCreated(created);
		mail.setJob(job);
		mail.setMailAddr(email);
		mail.setName(name);
		mail.setPhone(phone); 
		mail.setReplied(null);
		mail.setStatus(0);
		mail.setTitle(title);
		mail.setType(type);	
		mail.setContent(content);
		mailService.insertMail(mail);		
		sendMail(mailbox, messageTitle, messageBody);		
		return null;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		return new ModelAndView("email");
	}
}
