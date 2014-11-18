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
@RequestMapping("/stopSearch.html")
public class StopSearchController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {
		String cid = request.getParameter("cid");
		String StandCode = request.getParameter("StandCode");
		String StandName = request.getParameter("StandName");
		String url = "http://www.szjt.gov.cn/apts/default.aspx";
		String result = "";
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod(url + "?cid=" + cid + "&StandCode="
				+ StandCode + "&StandName=" + StandName);
		int statusCode;
		Map<String, Object> map = new HashMap<String, Object>();		
		try {
			statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				result = "Error!";
				map.put("result", result);			
				return new ModelAndView("searchBus", map);
			}			
			Document doc = Jsoup
					.parse(getMethod.getResponseBodyAsString());
			
			Element span = doc.getElementById("MainContent_DATA");
			String table = span.toString().replaceAll("APTSLine.aspx",
					"lineSearch.html");
			map.put("result", table);
			map.put("name", new String(StandName.getBytes("ISO-8859-1"), "UTF-8")); 
			map.put("type", "1");
			return new ModelAndView("searchBus", map);
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error!";
			map.put("result", result);			
			return new ModelAndView("searchBus", map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Error!";
			map.put("result", result);			
			return new ModelAndView("searchBus", map);
		}

	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		String url = "http://www.szjt.gov.cn/apts/default.aspx";
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(url);
		postMethod.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");
		NameValuePair[] data = {
				new NameValuePair("__VIEWSTATE",
						"/wEPDwULLTE5ODM5MjcxNzlkZI6G5BRzUdskhCZlnEaq908K57rffnLIIQaj+SS/lEx3"),
				new NameValuePair("__VIEWSTATEGENERATOR", "7BCA6D38"),
				new NameValuePair(
						"__EVENTVALIDATION",
						"/wEWBQLBpcbHAwLq+uyKCAKkmJj/DwL0+sTIDgLl5vKEDgB1HJbeXqriwNGMfLxbB3/j63P66ss/L27YQwHCyDNt"),
				new NameValuePair("ctl00$MainContent$StandName", name),
				new NameValuePair("ctl00$MainContent$SearchCode", "ËÑË÷"),
				new NameValuePair("ctl00$MainContent$StandCode", "") };
		postMethod.setRequestBody(data);
		int statusCode = 0;		
		try {
			statusCode = httpClient.executeMethod(postMethod);
			if (statusCode == 200) {
				Document doc = Jsoup
						.parse(postMethod.getResponseBodyAsString());
				Element span = doc.getElementById("MainContent_DATA");
				String table = span.toString().replaceAll("default.aspx",
						"stopSearch.html");
				out.print(table);
				// Elements trList = span.select("tr");
				//System.out.println(table);
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