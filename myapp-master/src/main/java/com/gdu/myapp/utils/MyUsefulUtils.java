package com.gdu.myapp.utils;

public class MyUsefulUtils {		
	public static String MY_INFO = "/myPage/myInfo.page?empCode=";

	public static String locationHref(String message, String url) {

	    String printMsg =
	                "<script>" +
	                        "alert('" + message + "');" +
	                        "location.href='" + url + "';" +
	                        "</script>";

	    return printMsg;
	}
}
