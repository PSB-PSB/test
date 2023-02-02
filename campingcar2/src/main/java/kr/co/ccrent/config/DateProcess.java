package kr.co.ccrent.config;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class DateProcess {

	public HashMap<String, Object> dateCalculate(String curYear, String curMon, int month) {
		// 날짜 세팅
		if(curYear==null || curMon==null) {
			Calendar cal = Calendar.getInstance();
			curYear = String.valueOf(cal.get(Calendar.YEAR));
			curMon = String.valueOf(cal.get(Calendar.MONTH)); // 0:1월 ~ 11:12월
		}
		int curYearInt = Integer.parseInt(curYear);
		int curMonInt = Integer.parseInt(curMon);
		Calendar curFirst = Calendar.getInstance();
		Calendar curLast = Calendar.getInstance();
		curFirst.set(curYearInt, curMonInt , 1);
		int curLastDay = curFirst.getActualMaximum(Calendar.DAY_OF_MONTH);
		if(month>0) {
			curMonInt = curMonInt+month;
			if(curMonInt>11) {
				curYearInt=curYearInt+1;
				curMonInt=curMonInt-12;
			}
			Calendar calTemp = Calendar.getInstance();
			calTemp.set(curYearInt, curMonInt, 1);
			curLastDay = calTemp.getActualMaximum(Calendar.DAY_OF_MONTH);
		}
		curLast.set(curYearInt, curMonInt, curLastDay);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, Object> resultmap = new HashMap<>();
		resultmap.put("firstday", format.format(curFirst.getTime()));
		resultmap.put("lastday", format.format(curLast.getTime()));
		return resultmap;
	}
	
	public String today(){
		Calendar cal = Calendar.getInstance();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(cal.getTime());
	}
	

	
}
