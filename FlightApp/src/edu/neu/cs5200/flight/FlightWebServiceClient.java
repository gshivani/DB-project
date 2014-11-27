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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class FlightWebServiceClient
{
	public void parseJSON(String origin, String destination, String departureDate, String arrivalDate)
	{
		DSApiCalls dsc = new DSApiCalls();
		String json = dsc.callApi(origin,destination, departureDate, arrivalDate);
		System.out.println(json);
		
		JSONParser parser = new JSONParser();
		
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
				 
				 for(int j=0; j<originDestinationOptions.size();j++)
				 {
					 JSONObject firstOriginDestination = (JSONObject) originDestinationOptions.get(j);
					 JSONArray flightsegment = (JSONArray) firstOriginDestination.get("FlightSegment");
					 
					 System.out.println(flightsegment.size());
					 
					 for(int k=0; k<flightsegment.size();k++)
					 {
						 JSONObject firstflightsegment =(JSONObject) flightsegment.get(k);
						 JSONObject firstDepartureAirport = (JSONObject) firstflightsegment.get("DepartureAirport");
						 
						 String departureLocationCode = firstDepartureAirport.get("LocationCode").toString();
						 System.out.println(departureLocationCode);
						 
						 JSONObject firstArrivalAirport = (JSONObject) firstflightsegment.get("ArrivalAirport");
						 String arrivalLocationCode = firstArrivalAirport.get("LocationCode").toString();
						 System.out.println(arrivalLocationCode);
						 
						 String departureDateTime = firstflightsegment.get("DepartureDateTime").toString();
						 System.out.println(departureDateTime);
						 
						 
						 String arrivalDateTime = firstflightsegment.get("ArrivalDateTime").toString();
						 System.out.println(arrivalDateTime);
						 
						 
						 int flightNumber = Integer.parseInt(firstflightsegment.get("FlightNumber").toString());
						 System.out.println(flightNumber);
						 
						 JSONObject operatingAirline = (JSONObject) firstflightsegment.get("OperatingAirline");
						 String airlineCode = operatingAirline.get("Code").toString();
						 System.out.println(airlineCode);
						 
					 }
					 
					 System.out.println(firstOriginDestination.get("ElapsedTime").toString());
				 }
				 
				 JSONObject firstAirItineraryPriceInfo = (JSONObject) firstPricedItinerary.get("AirItineraryPricingInfo");
				 
				 JSONObject ptcFareBreakdowns = (JSONObject) firstAirItineraryPriceInfo.get("PTC_FareBreakdowns");
				 
				 JSONObject ptcFareBreakdown = (JSONObject) ptcFareBreakdowns.get("PTC_FareBreakdown");
				 
				 JSONObject passengerFare = (JSONObject) ptcFareBreakdown.get("PassengerFare");
				 
				 JSONObject totalFare = (JSONObject) passengerFare.get("TotalFare");
				 
				 String amount = totalFare.get("Amount").toString();
				 
				 System.out.println(amount);
				 
				 
				 System.out.println(firstAirItinerary.get("DirectionInd").toString());
				 
				 System.out.println(firstPricedItinerary.get("SequenceNumber").toString());
			}
			
	     }
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		}
	
	public static void main(String args[])throws IOException
	{
		FlightWebServiceClient client = new FlightWebServiceClient();
		client.parseJSON("BOS","LAX", "2014-12-03","2014-12-10");
	}
}
