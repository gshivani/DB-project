package edu.neu.cs5200.flight;
import com.sabre.devstudio.samples.dsApiCall.DSApiCalls; 
import com.sabre.devstudio.samples.dsApiCall.DSCommHandler;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class FlightWebServiceClient
{
	
	 List<String> departureLocationCode;
	 List<String> arrivalLocationCode;
	 List<String> departureDateTime;
	 List<String> arrivalDateTime;
	 List<Integer> flightNumber;
	 List<String> airlineCode;
	 double amount;
	 
	 
	public List<DisplayFlight> parseJSON(String origin, String destination, String departureDate, String arrivalDate)
	{
		
		DSApiCalls dsc = new DSApiCalls();
		String json = dsc.callApi(origin,destination, departureDate, arrivalDate);
		System.out.println(json);
		
		JSONParser parser = new JSONParser();
		
		List<DisplayFlight> arr_display = new ArrayList<DisplayFlight>();
		
		 
		try
		{
			JSONObject root = (JSONObject) parser.parse(json);
			JSONArray data = (JSONArray) root.get("PricedItineraries");
			
			System.out.println(data.size());
			
			for(int i=0; i< data.size(); i++)
			{
				 JSONObject firstPricedItinerary = (JSONObject) data.get(i);
				 JSONObject firstAirItinerary = (JSONObject) firstPricedItinerary.get("AirItinerary");
				 JSONObject originDestination = (JSONObject) firstAirItinerary.get("OriginDestinationOptions");
				 
				 JSONArray originDestinationOptions = (JSONArray) originDestination.get("OriginDestinationOption");
				 
				 
				 departureLocationCode = new ArrayList<String>();
				 arrivalLocationCode = new ArrayList<String>();
				 departureDateTime = new ArrayList<String>();
				 arrivalDateTime = new ArrayList<String>();
				 flightNumber = new ArrayList<Integer>();
				 airlineCode = new ArrayList<String>();
				 
				 for(int j=0; j<originDestinationOptions.size();j++)
				 {
					 JSONObject firstOriginDestination = (JSONObject) originDestinationOptions.get(j);
					 JSONArray flightsegment = (JSONArray) firstOriginDestination.get("FlightSegment");
					 
					 System.out.println(flightsegment.size());
					 					 
					 
					 for(int k=0; k<flightsegment.size();k++)
					 {
						 JSONObject firstflightsegment =(JSONObject) flightsegment.get(k);
						 JSONObject firstDepartureAirport = (JSONObject) firstflightsegment.get("DepartureAirport");
						 
						 
						 String departureLocationCode1 = firstDepartureAirport.get("LocationCode").toString();
						 departureLocationCode.add(departureLocationCode1);
						 System.out.println(departureLocationCode.size());
						 
						 JSONObject firstArrivalAirport = (JSONObject) firstflightsegment.get("ArrivalAirport");
						 String arrivalLocationCode1 = firstArrivalAirport.get("LocationCode").toString();
						 arrivalLocationCode.add(arrivalLocationCode1);
						 System.out.println(arrivalLocationCode.size());
						 
						 String departureDateTime1 = firstflightsegment.get("DepartureDateTime").toString();
						 departureDateTime.add(departureDateTime1);
						 System.out.println(departureDateTime.size());
						 
						 
						 String arrivalDateTime1 = firstflightsegment.get("ArrivalDateTime").toString();
						 arrivalDateTime.add(arrivalDateTime1);
						 System.out.println(arrivalDateTime.size());
						 
						 
						 Integer flightNumber1 = Integer.parseInt(firstflightsegment.get("FlightNumber").toString());
						 flightNumber.add(flightNumber1);
						 System.out.println(flightNumber.size());
						 
						 JSONObject operatingAirline = (JSONObject) firstflightsegment.get("OperatingAirline");
						 String airlineCode1 = operatingAirline.get("Code").toString();
						 airlineCode.add(airlineCode1);
						 System.out.println(airlineCode.size());
						 
					 }
					 
					 }
				 
				 for(String dp : departureLocationCode)
						System.out.println(dp);
					
				 
				 JSONObject firstAirItineraryPriceInfo = (JSONObject) firstPricedItinerary.get("AirItineraryPricingInfo");
				 
				 JSONObject ptcFareBreakdowns = (JSONObject) firstAirItineraryPriceInfo.get("PTC_FareBreakdowns");
				 
				 JSONObject ptcFareBreakdown = (JSONObject) ptcFareBreakdowns.get("PTC_FareBreakdown");
				 
				 JSONObject passengerFare = (JSONObject) ptcFareBreakdown.get("PassengerFare");
				 
				 JSONObject totalFare = (JSONObject) passengerFare.get("TotalFare");
				 
				  amount = Double.parseDouble(totalFare.get("Amount").toString());
				 
				 System.out.println(amount);
				 
				 
				 System.out.println(firstAirItinerary.get("DirectionInd").toString());
				 
				 System.out.println(firstPricedItinerary.get("SequenceNumber").toString());
				 
				 DisplayFlight display = new DisplayFlight(departureLocationCode,arrivalLocationCode,departureDateTime,arrivalDateTime,flightNumber,airlineCode,amount);
			      
				 arr_display.add(display);
			}
			
	     }
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		System.out.println(arr_display.size());
		
		
		return arr_display;
		
}
	
	public static void main(String args[])throws IOException
	{
		FlightWebServiceClient client = new FlightWebServiceClient();
		List<DisplayFlight> arr = client.parseJSON("BOS","LAX", "2014-12-03","2014-12-10");
		
		
		
	}
}
