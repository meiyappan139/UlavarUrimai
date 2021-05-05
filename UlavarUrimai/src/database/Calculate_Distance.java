package database;

public class Calculate_Distance {
	  
	public static double distance(double lat1, double lon1, double lat2, double lon2, char unit) {
	  double theta = lon1 - lon2;
	  double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
	  dist = Math.acos(dist);
	  dist = rad2deg(dist);
	  dist = dist * 60 * 1.1515;
	  if (unit == 'K') {
	    dist = dist * 1.609344;
	  } else if (unit == 'N') {
	  dist = dist * 0.8684;
	    }
	  return (dist);
	}


	public static double deg2rad(double deg) {
	  return (deg * Math.PI / 180.0);
	}


	public static double rad2deg(double rad) {
	  return (rad * 180.0 / Math.PI);
	}


    public static void main(String[] args) {
		   
		  System.out.println(distance(11.005680,77.034148 ,11.026432,76.9785856, 'M') + " Miles\n");
	      System.out.println(distance(11.005680,77.034148 ,11.026432,76.9785856, 'K') + " Kilometers\n");
	 }

}
