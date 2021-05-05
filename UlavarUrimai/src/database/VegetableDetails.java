package database;

import java.util.HashMap;
import java.util.Map;

public class VegetableDetails 
{
     public static Map<String,Integer> list()
     {
    	Map<String,Integer> map=new HashMap<String, Integer>();
    	map.put("Beans",2);
    	map.put("Beetroot", 3);
    	map.put("Broccoli", 3);
    	map.put("Brussels",3);
    	map.put("Brinjal", 4);
    	map.put("Cabbage", 3);
    	map.put("Carrot", 4);
    	map.put("Cauliflower", 3);
    	map.put("Cucumber", 3);
	    map.put("lettuce",3);
     	map.put("Onion", 15);
    	map.put("Parsnips", 4);
    	map.put("Peas", 3);
    	map.put("Peppers", 14);
    	map.put("Potato", 15);
    	map.put("Radish", 14);
        map.put("SweetCorn", 4);
    	map.put("Tomato", 7);
    	map.put("Turnip", 4);
		map.put("ladysfinger",3);
		map.put("drumstick", 3);
		map.put("Luffa", 4);
		return map;
    	 
     }

}
