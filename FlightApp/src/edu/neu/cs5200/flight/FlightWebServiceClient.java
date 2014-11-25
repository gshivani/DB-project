package edu.neu.cs5200.flight;

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
	
	
	public void parseJSON(String origin, String destination)
	{
		try {
			String urlApi= "http://partners.api.skyscanner.net/apiservices/browsedates/v1.0/US/USD/en-US/"+
		                   origin+"/"+destination+"/2014-11-25/2014-11-25?apiKey=no134842991214289586413891281748";
			
			URL url = new URL(urlApi);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Accept", "application/json");
			InputStream stream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(stream);
			BufferedReader buffer = new BufferedReader(reader);
			String line;
			String json = "";
			while((line = buffer.readLine()) != null) {
				json += line;
			}
			System.out.println(json);
			
			JSONParser parser = new JSONParser();
			try
			{
				JSONObject root = (JSONObject) parser.parse(json);
				JSONArray data = (JSONArray) root.get("Carriers");
				
				for(int i=0; i< data.size(); i++){
			    JSONObject firstCarrier = (JSONObject) data.get(i);
			    
				Flight flights = new Flight();
				flights.setCarrierId(Integer.parseInt(firstCarrier.get("CarrierId").toString()));
				flights.setName(firstCarrier.get("Name").toString());
				
				FlightDao dao = new FlightDao();
				Flight persistedflights = dao.createFlight(flights);
				System.out.println(persistedflights.getCarrierId());
				System.out.println(persistedflights.getName());
				}
				
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			}catch(Exception e)
			{
				System.out.println(e);
			}
			
	}
	
	public static void main(String args[])throws IOException
	{
		FlightWebServiceClient client = new FlightWebServiceClient();
		client.parseJSON("BOS","LAX");
	}
}
