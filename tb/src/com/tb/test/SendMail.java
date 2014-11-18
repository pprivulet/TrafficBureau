package com.tb.test;

import java.io.IOException;
import java.util.Properties;
import java.util.Date;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Multipart;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.activation.*;

public class SendMail {

	public static void main(String[] args) {

		final String username = "panzhoujin@tsari.tsinghua.edu.cn";
		final String password = "tsari1234";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "mail.tsari.tsinghua.edu.cn");
		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

		try {
			// Message message = new MimeMessage(session);
			// message.setFrom(new
			// InternetAddress("panzhoujin@tsari.tsinghua.edu.cn"));
			// message.setRecipients(Message.RecipientType.TO,
			// InternetAddress.parse("panzhoujin@tsari.tsinghua.edu.cn"));
			// // Set Subject: header field
			// message.setSubject("This is the Subject Line!");
			//
			// // Create the message part
			// BodyPart messageBodyPart = new MimeBodyPart();
			//
			// // Fill the message
			// messageBodyPart.setText("This is message body");
			//
			// // Create a multipar message
			// Multipart multipart = new MimeMultipart();
			//
			// // Set text message part
			// multipart.addBodyPart(messageBodyPart);
			//
			// // Part two is attachment
			// messageBodyPart = new MimeBodyPart();
			// String filename = "demo.txt";
			// DataSource source = new FileDataSource(filename);
			// messageBodyPart.setDataHandler(new DataHandler(source));
			// messageBodyPart.setFileName(filename);
			// multipart.addBodyPart(messageBodyPart);
			//
			// // Send the complete message parts
			// message.setContent(multipart );
			//
			// // Send message
			// Transport.send(message);
			// System.out.println("Sent message successfully....");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(
					"panzhoujin@tsari.tsinghua.edu.cn"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("panzhoujin@tsari.tsinghua.edu.cn"));
			message.setSubject("Testing Subject");
			message.setText("Dear Mail Crawler,"
					+ "\n\n No spam to my email, please!");

			Transport.send(message);

			System.out.println("Done");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
