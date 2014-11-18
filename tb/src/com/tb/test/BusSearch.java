package com.tb.test;

import java.io.IOException;



import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BusSearch {

	public static void main(String[] argv) {

		// String url = "http://www.szjt.gov.cn/apts/default.aspx";
		//
		// // Document doc = Jsoup.connect(url).get();
		//
		// // System.out.println(doc);
		//
		// HttpClient httpClient = new HttpClient();
		// PostMethod postMethod = new PostMethod(url);
		//
		// postMethod.setRequestHeader("Content-Type",
		// "application/x-www-form-urlencoded; charset=UTF-8");
		// NameValuePair[] data = {
		// new NameValuePair("__VIEWSTATE",
		// "/wEPDwULLTE5ODM5MjcxNzlkZI6G5BRzUdskhCZlnEaq908K57rffnLIIQaj+SS/lEx3"),
		// new NameValuePair("__VIEWSTATEGENERATOR", "7BCA6D38"),
		// new NameValuePair(
		// "__EVENTVALIDATION",
		// "/wEWBQLBpcbHAwLq+uyKCAKkmJj/DwL0+sTIDgLl5vKEDgB1HJbeXqriwNGMfLxbB3/j63P66ss/L27YQwHCyDNt"),
		// new NameValuePair("ctl00$MainContent$StandName", "ÑÇÐñµç×Ó"),
		// new NameValuePair("ctl00$MainContent$SearchCode", "ËÑË÷"),
		// new NameValuePair("ctl00$MainContent$StandCode", "") };
		// postMethod.setRequestBody(data);
		// int statusCode;
		// try {
		// statusCode = httpClient.executeMethod(postMethod);
		// if (statusCode == 200) {
		// Document doc = Jsoup
		// .parse(postMethod.getResponseBodyAsString());
		// Element span = doc.getElementById("MainContent_DATA");
		// System.out.println(span);
		// String table = span.toString().replaceAll("default.aspx",
		// "stopSearch.html");
		// //Elements trList = span.select("tr");
		// System.out.println(table);
		// } else {
		//
		// }
		// } catch (HttpException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		//

		String url = "http://www.szjt.gov.cn/apts/APTSLine.aspx?cid=175ecd8d-c39d-4116-83ff-109b946d7cb4";
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(url);
		postMethod.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");
		NameValuePair[] data = {
				new NameValuePair(
						"__VIEWSTATE",
						"/wEPDwUJNDk3MjU2MjgyD2QWAmYPZBYCAgMPZBYCAgEPZBYCAgYPDxYCHgdWaXNpYmxlaGRkZIRQOyvU8esCyqSqyd1qgFhT2+bZFSmxXzTNIR5o8kew"),
				new NameValuePair("__VIEWSTATEGENERATOR", "964EC381"),
				new NameValuePair("__EVENTVALIDATION",
						"/wEWAwKlwd6yBgL88Oh8AqX89aoKI18g5BVqDt3u2EEcQKTwefOjflsUjJWVUHv9BIcrXWc="),
				new NameValuePair("ctl00$MainContent$LineName", "111"),
				new NameValuePair("ctl00$MainContent$SearchLine", "ËÑË÷") };
		postMethod.setRequestBody(data);
		int statusCode = 0;

		try {
			statusCode = httpClient.executeMethod(postMethod);
			System.out.println(statusCode);
			if (statusCode == 200) {
				Document doc = Jsoup
						.parse(postMethod.getResponseBodyAsString());
				Element span = doc.getElementById("MainContent_DATA");
				String table = span.toString().replaceAll("APTSLine.aspx",
						"lineSearch.html");

				System.out.println(table);
				// Elements trList = span.select("tr");
				// System.out.println(trList);
			} else {
				System.out.println("error");
			}
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

}
