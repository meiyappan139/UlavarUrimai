package database;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Calculate_No_of_Days {

	public static int Calculate(String before,String after) {
		
		String beforeArr[]=before.split("/");
		String afterArr[]=after.split("/");
		
		String beforeString=beforeArr[2]+"-"+beforeArr[1]+"-"+beforeArr[0];
		String afterString=afterArr[2]+"-"+afterArr[1]+"-"+afterArr[0];
		
		String dateBeforeString = beforeString;
		String dateAfterString = afterString;
	
		LocalDate dateBefore = LocalDate.parse(dateBeforeString);
		LocalDate dateAfter = LocalDate.parse(dateAfterString);
		
		long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
		
		return (int) noOfDaysBetween;
	}
}
