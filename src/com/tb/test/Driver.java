package com.tb.test;


import com.tb.domain.Entry;
import com.tb.service.EntryService;
import com.tb.service.PagingService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



import java.util.List;

public class Driver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context=
				new ClassPathXmlApplicationContext("config/spring/applicationContext.xml");		
			
		EntryService  es = (EntryService)context.getBean("entryService");
		int begin = 0;
		int pageSize = 30;
		int category = 1;
		int page = 1;
		//List<Entry> entryList = (List<Entry>) es.getEntryList(begin, offset, category);
		//for(Entry e:entryList){		
		//	System.out.println(e.getTitle() + e.getCreateDate()+ e.getCategory());		
		//}
		
			
		
		int total = 0;
		
		total = es.getEntryNum(category);
		
		System.out.println(total);
		
		PagingService  ps = (PagingService)context.getBean("pagingService");
		
		total = ps.getPageCount(category);
		System.out.println(total);
		
		ps.setCurrentPage(page);
		ps.setPageSize(pageSize);
		List<Entry> entryList = (List<Entry>)ps.getEntryList(category);
		for(Entry e:entryList){		
			System.out.println(e.getTitle()  + " " +  e.getCategory());		
	    }
		 
		
		
	}

}
