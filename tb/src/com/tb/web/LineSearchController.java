package com.tb.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lineSearch.html")
public class LineSearchController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {
		
		String cid = request.getParameter("cid");
		String LineGuid = request.getParameter("LineGuid");
		String LineInfo = request.getParameter("LineInfo");
		String url = "http://www.szjt.gov.cn/apts/APTSLine.aspx";
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod(url + "?cid=" + cid + "&LineGuid="
				+ LineGuid + "&LineInfo=" + LineInfo);
		int statusCode;
		Map<String, Object> map = new HashMap<String, Object>();
		String result = "Error!";
		//System.out.println(result);
		try {
			statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				map.put("result", result);
				return new ModelAndView("searchBus", map);
			}

			Document doc = Jsoup.parse(getMethod.getResponseBodyAsString());
			Element span = doc.getElementById("MainContent_DATA");
			String table = span.toString().replaceAll("default.aspx",
					"stopSearch.html");
			map.put("result", table);
			map.put("name", new String(LineInfo.getBytes("ISO-8859-1"), "UTF-8"));  
			map.put("type", "2");		
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", result);			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", result);
			
		}
		return new ModelAndView("searchBus", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		String url = "http://www.szjt.gov.cn/apts/APTSLine.aspx?cid=175ecd8d-c39d-4116-83ff-109b946d7cb4";
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(url);
		postMethod.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");
		NameValuePair[] data = {
				new NameValuePair("__VIEWSTATE",
						"/wEPDwUJNDk3MjU2MjgyD2QWAmYPZBYCAgMPZBYCAgEPZBYCAgYPDxYCHgdWaXNpYmxlaGRkZIRQOyvU8esCyqSqyd1qgFhT2+bZFSmxXzTNIR5o8kew"),
				new NameValuePair("__VIEWSTATEGENERATOR", "964EC381"),
				new NameValuePair(
						"__EVENTVALIDATION",
						"/wEWAwKlwd6yBgL88Oh8AqX89aoKI18g5BVqDt3u2EEcQKTwefOjflsUjJWVUHv9BIcrXWc="),
				new NameValuePair("ctl00$MainContent$LineName", name),
				new NameValuePair("ctl00$MainContent$SearchLine", "ËÑË÷")
				};
		postMethod.setRequestBody(data);
		int statusCode = 0;
		System.out.println(name);
		try {
			statusCode = httpClient.executeMethod(postMethod);
			System.out.println(statusCode);
			if (statusCode == 200) {
				Document doc = Jsoup
						.parse(postMethod.getResponseBodyAsString());
				Element span = doc.getElementById("MainContent_DATA");
				String table = span.toString().replaceAll("APTSLine.aspx",
						"lineSearch.html");
				out.print(table);
				System.out.println(table);				
			} else {
				out.print("error");
			}
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print("error");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print("error");
		}
		return null;
	}
}