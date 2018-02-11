package UID;

import java.text.SimpleDateFormat;
import java.util.Date;

public class uidkey {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date now=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyMMddHHmmssSSS");
		String uidx=dateFormat.format(now);
		System.out.print(uidx);
	}

}
