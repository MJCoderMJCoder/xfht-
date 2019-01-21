package com.cxgc.front.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * @author Tom
 */
public class DateUtils {
	protected final Logger log = Logger.getLogger(DateUtils.class);
	
	private StringBuffer buffer = new StringBuffer();
	private static String ZERO = "0";
	private static DateUtils date;
	public static SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	public static SimpleDateFormat format1 = new SimpleDateFormat(
			"yyyyMMdd HH:mm:ss");
	public static SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	public static SimpleDateFormat format3 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");
	public static SimpleDateFormat format4 = new SimpleDateFormat("HH:mm");
	public static SimpleDateFormat format7 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public static SimpleDateFormat format9 = new SimpleDateFormat("HH:mm:ss");
	/**
	 * TODO:得到制定日期的短日期
	 * @param date 
	 * @return
	 */
	public static String getShortNowDate() {
		try {
			return format2.format(new Date());
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * TODO:得到制定日期的短日期
	 * @param date 
	 * @return
	 */
	public static String getShort2Date(Date date) {
		try {
			return format3.format(date);
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * TODO:得到制定日期的短日期
	 * @param date 
	 * @return
	 */
	public static Date getString2Date3(String date) {
		try {
			return format3.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public static String getShort3Date(Date date) {
		try {
			return format4.format(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	public String getNowString() {
		Calendar calendar = getCalendar();
		buffer.delete(0, buffer.capacity());
		buffer.append(getYear(calendar));

		if (getMonth(calendar) < 10) {
			buffer.append(ZERO);
		}
		buffer.append(getMonth(calendar));

		if (getDate(calendar) < 10) {
			buffer.append(ZERO);
		}
		buffer.append(getDate(calendar));
		if (getHour(calendar) < 10) {
			buffer.append(ZERO);
		}
		buffer.append(getHour(calendar));
		if (getMinute(calendar) < 10) {
			buffer.append(ZERO);
		}
		buffer.append(getMinute(calendar));
		if (getSecond(calendar) < 10) {
			buffer.append(ZERO);
		}
		buffer.append(getSecond(calendar));
		return buffer.toString();
	}

	private static int getDateField(Date date, int field) {
		Calendar c = getCalendar();
		c.setTime(date);
		return c.get(field);
	}

	public static int getYearsBetweenDate(Date begin, Date end) {
		int bYear = getDateField(begin, Calendar.YEAR);
		int eYear = getDateField(end, Calendar.YEAR);
		return eYear - bYear;
	}

	public static int getMonthsBetweenDate(Date begin, Date end) {
		int bMonth = getDateField(begin, Calendar.MONTH);
		int eMonth = getDateField(end, Calendar.MONTH);
		return eMonth - bMonth;
	}

	public static int getWeeksBetweenDate(Date begin, Date end) {
		int bWeek = getDateField(begin, Calendar.WEEK_OF_YEAR);
		int eWeek = getDateField(end, Calendar.WEEK_OF_YEAR);
		return eWeek - bWeek;
	}

	public static int getDaysBetweenDate(Date begin, Date end) {
		return (int) ((end.getTime()-begin.getTime())/(1000 * 60 * 60 * 24));
	}

	public static void main(String args[]) {
		System.out.println(getSpecficDateStart(new Date(), 288));
	}

	/**
	 * 获取date年后的amount年的第一天的开始时间
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficYearStart(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, amount);
		cal.set(Calendar.DAY_OF_YEAR, 1);
		return getStartDate(cal.getTime());
	}

	/**
	 * 获取date年后的amount年的最后一天的终止时间
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficYearEnd(Date date, int amount) {
		Date temp = getStartDate(getSpecficYearStart(date, amount + 1));
		Calendar cal = Calendar.getInstance();
		cal.setTime(temp);
		cal.add(Calendar.DAY_OF_YEAR, -1);
		return getFinallyDate(cal.getTime());
	}

	/**
	 * 获取date月后的amount月的第一天的开始时间
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficMonthStart(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, amount);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return getStartDate(cal.getTime());
	}

	/**
	 * 获取当前自然月后的amount月的最后一天的终止时间
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficMonthEnd(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getSpecficMonthStart(date, amount + 1));
		cal.add(Calendar.DAY_OF_YEAR, -1);
		return getFinallyDate(cal.getTime());
	}

	/**
	 * 获取date周后的第amount周的开始时间（这里星期一为一周的开始）
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficWeekStart(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.MONDAY); /* 设置一周的第一天为星期一 */
		cal.add(Calendar.WEEK_OF_MONTH, amount);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return getStartDate(cal.getTime());
	}

	/**
	 * 获取date周后的第amount周的最后时间（这里星期日为一周的最后一天）
	 * 
	 * @param amount
	 *            可正、可负
	 * @return
	 */
	public static Date getSpecficWeekEnd(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY); /* 设置一周的第一天为星期一 */
		cal.add(Calendar.WEEK_OF_MONTH, amount);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		return getFinallyDate(cal.getTime());
	}

	public static Date getSpecficDateStart(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, amount);
		return getStartDate(cal.getTime());
	}
	
	public static Date getSpecficDateEnd(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, amount);
		return getFinallyDate(cal.getTime());
	}

	/**
	 * 得到指定日期的一天的的最后时刻23:59:59
	 * 
	 * @param date
	 * @return
	 */
	public static Date getFinallyDate(Date date) {
		String temp = format.format(date);
		temp += " 23:59:59";

		try {
			return format1.parse(temp);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 得到指定日期的一天的开始时刻00:00:00
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDate(Date date) {
		String temp = format.format(date);
		temp += " 00:00:00";

		try {
			return format1.parse(temp);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * format1 字符串格式化时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStr2Date7(String date) {
		try {
			return format7.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * format1 时间格式化字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate2Str9(Date date) {
		try {
			return format9.format(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * format1 字符串格式化时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStr2Date9(String date) {
		try {
			return format9.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * format1时间格式化字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate2Str(Date date) {
		try {
			return format.format(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * format 字符串格式化时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStr2Date(String date) {
		try {
			return format.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * format1 时间格式化字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate2Str7(Date date) {
		try {
			return format7.format(date);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * format1 时间格式化字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String getDate2Str2(Date date) {
		try {
			return format2.format(date);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * format1 时间格式化字符串
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStr2Date2(String str) {
		try {
			return format2.parse(str);
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * TODO:得到制定日期的短日期
	 * @param date 
	 * @return
	 */
	public static String getShortDate(Date date) {
		try {
			return format2.format(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 
	 * @param date
	 *            指定比较日期
	 * @param compareDate
	 * @return
	 */
	public static boolean isInDate(Date date, Date compareDate) {
		if (compareDate.after(getStartDate(date))
				&& compareDate.before(getFinallyDate(date))) {
			return true;
		} else {
			return false;
		}

	}
	
	private static String[] CHINESE_MONTHS ={"一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"};
	private static String[] MONTHS ={"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};
	
	/** 
	 * 中文日期转为Date
	 * 
	 * @param cDate
	 *            可正、可负
	 * @return
	 */
	public static Date ZHStr2Date(String cDate) {
		Calendar calendar = Calendar.getInstance();
		
		String[] yMd_Hm = cDate.split("-");
		String[] yMd = yMd_Hm[0].split(" ");
		calendar.set(Calendar.YEAR,Integer.parseInt(yMd[2].trim()));
		for(int i = 0 ; i <CHINESE_MONTHS.length ; i++){
			if(CHINESE_MONTHS[i].equals(yMd[1].trim())){
				yMd[1] = MONTHS[i]; 
			}
		}
		calendar.set(Calendar.MONTH,Integer.parseInt(yMd[1])-1);
		calendar.set(Calendar.DAY_OF_MONTH,Integer.parseInt(yMd[0].trim()));
		
		String[] Hm = yMd_Hm[1].split(":");
		calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(Hm[0].trim()));
		calendar.set(Calendar.MINUTE, Integer.parseInt(Hm[1].trim()));
		
		return calendar.getTime();
	}
	/**
	 * Date转为中文日期
	 * 
	 * @param date
	 * @return
	 */
	public static String Date2ZHStr(Date date) {
		String space = " ";
		String sign1 = "-";
		String sign2 = ":";
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.format("%02d", calendar.get(Calendar.MONTH) + 1);
		String day = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		String hour = String.valueOf(calendar.get(Calendar.HOUR_OF_DAY));
		String minute = String.valueOf(calendar.get(Calendar.MINUTE));

		for(int i = 0 ; i <MONTHS.length ; i++){
			if(MONTHS[i].equals(month)){
				month = CHINESE_MONTHS[i];
			}
		}
		
		return day + space + month + space + year + space + sign1 + space + hour + sign2 + minute;
	}
	
	/**
	 * 获取两个时间的差值秒
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static Integer getSecondBetweenDate(Date d1,Date d2){
		Long second=(d2.getTime()-d1.getTime())/1000;
		return second.intValue();
	}

	private int getYear(Calendar calendar) {
		return calendar.get(Calendar.YEAR);
	}

	private int getMonth(Calendar calendar) {
		return calendar.get(Calendar.MONDAY) + 1;
	}

	private int getDate(Calendar calendar) {
		return calendar.get(Calendar.DATE);
	}

	private int getHour(Calendar calendar) {
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	private int getMinute(Calendar calendar) {
		return calendar.get(Calendar.MINUTE);
	}

	private int getSecond(Calendar calendar) {
		return calendar.get(Calendar.SECOND);
	}

	private static Calendar getCalendar() {
		return Calendar.getInstance();
	}

	public static DateUtils getDateInstance() {
		if (date == null) {
			date = new DateUtils();
		}
		return date;
	}
}
