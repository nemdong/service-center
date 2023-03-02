package com.example.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public static Date textToDate(String date) {
		return textToDate(date, "00:00");
	}

	public static Date textToDate(String date, String time) {
		try {
			if (time == null) {
				return sdf.parse(date + " 00:00");
			}
			return sdf.parse(date + " " + time);
		} catch (ParseException ex) {
			throw new RuntimeException(ex);
		}
	}
}
