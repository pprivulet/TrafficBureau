package com.tb.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tb.domain.Mail;
import com.tb.domain.VoteOption;
import com.tb.domain.VoteQuiz;
import com.tb.domain.VoteTheme;
import com.tb.service.MailService;
import com.tb.service.VoteOptionService;
import com.tb.service.VoteQuizService;
import com.tb.service.VoteThemeService;

import javax.servlet.http.Cookie;

public class Driver {

	public static void main(String[] args) throws NoSuchAlgorithmException {

		 ApplicationContext context = new ClassPathXmlApplicationContext(
		 "config/spring/applicationContext.xml");

		 VoteThemeService voteThemeService = (VoteThemeService) context.getBean("voteThemeService");
		 VoteTheme voteTheme = new VoteTheme();
		 voteTheme.setContent("某某问卷调查");
		 voteTheme.setStatus(0);
		 voteThemeService.insertVoteTheme(voteTheme);
		 //System.out.println(voteThemeService.getClosedVoteThemeList(0, -1));
		
		 VoteQuizService voteQuizService = (VoteQuizService) context.getBean("voteQuizService");
		 VoteQuiz voteQuiz = new VoteQuiz();
		 voteQuiz.setContent("现在的某某路您是否满意？");
		 voteQuiz.setVoteThemeId(132);		
		
		 voteQuizService.insertVoteQuiz(voteQuiz);
		// System.out.println(voteQuizService.getVoteQuizListByThemeId(1));
		
		
		// System.out.println(voteQuizService.getVoteQuizListByThemeId(2));
		 
		// VoteOptionService voteOptionService = (VoteOptionService)context.getBean("voteOptionService");
		 
		 //VoteOption voteOption = new VoteOption();
		 //voteOption.setIndex(1);
		 //voteOption.setContent("满意");
		 //voteOption.setVote(0);
		 //voteOption.setVoteQuizId(1);
		 //voteOption.setVoteThemeId(1);
		 //voteOptionService.insertVoteOption(voteOption);
		 //voteOption.setContent("一般");
		 //voteOption.setIndex(2);
		 //voteOption.setVoteQuizId(2);
		 //voteOption.setVoteThemeId(1);
		 //voteOptionService.insertVoteOption(voteOption);
		 
		// System.out.println(voteOptionService.getVoteOptionListByQuizId(1));
		 //System.out.println(voteOptionService.getVoteOptionListByThemeId(1, 2));
		 
		 
		 //voteQuizService.deleteByThemeId(1);
		 //voteQuizService.deleteById(2);
		 
		 // PhileService fileService = (PhileService)
		// context.getBean("fileService");

		// Phile file = new Phile();
		// List<Phile> fileList = new List<Phile>();
		// file.setEntryId(1);
		// file.setPath("/中文路劲");
		// file.setStatus(0);
		// file.setType(0);

//		MailService mailService = (MailService) context.getBean("mailService");
//		Mail mail = new Mail();
//		mail.setAddress("地址");
//		mail.setContent("内容内容");
//		mail.setCreated("20131110120000");
//		mail.setJob("工作");
//		mail.setMailAddr("");
//		mail.setName("嘿嘿");
//		mail.setPhone(""); 
//		mail.setReplied("20131110120000");
//		mail.setStatus(0);
//		mail.setTitle("哈哈哈");
//		mail.setType(0);
		
		//mailService.insertMail(mail);
		//System.out.println(mailService.getMailNum(-1));
		
		//System.out.println(mailService.getMailList(0, mailService.getMailNum(-1), -1));
		
//		mail.setId(5);
//		mail.setStatus(1);
//		mail.setReplied("20141110120000");
//		mailService.updateMailStatus(mail);
//		mailService.deleteById(5);
//		System.out.println(mailService.findById(5));
		// file = fileService.findByEntryID(1);
		// System.out.println(file);

		// System.out.println(fileService.insert(file));

//		String url = "http://www.zgwj.gov.cn/upfile/template/contentpage/zgwj_zwgknew/xxgkdt.aspx?Itemtype=6&WebID=145&nodeID=3954";
//		Document doc;
//		try {
//			doc = Jsoup.connect(url).get();
//			Elements tables = doc.select("table[bordercolor=#CCCCCC]");
//			Elements trList = tables.select("tr");
//
//			for (int i = 1; i < trList.size(); i++) {
//				Elements tdList = trList.get(i).select("td");
//				System.out.println(tdList);
//			}
//
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
/*		
		System.out.println(Driver.class.getResource("/"));		
		System.out.println(Driver.class.getResource("/config/mailbox.properties"));   
		
		String filepath = Driver.class.getResource("/config/mailbox.properties").getFile().toString();
		
		
		
		Properties prop = new Properties();
		InputStream input = null;
	 
		try {
	 
			input = new FileInputStream(filepath);
	 
			// load a properties file
			prop.load(input);
	 
			// get the property value and print it out
			System.out.println(prop.getProperty("server"));
			System.out.println(prop.getProperty("port"));
			System.out.println(prop.getProperty("account"));
			System.out.println(prop.getProperty("password"));
			System.out.println(prop.getProperty("toAddress"));
			
			
	 
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		*/
	}

}
