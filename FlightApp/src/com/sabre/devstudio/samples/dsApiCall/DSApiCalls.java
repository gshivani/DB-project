package com.sabre.devstudio.samples.dsApiCall;
import org.apache.tomcat.util.codec.binary.Base64;


public class DSApiCalls {

	
public String callApi(String origin, String destination, String departureDate, String arrivalDate) {
		
		// TODO Auto-generated method stub
		//
		//Request authentication
		//
		final String clientId = "V1:qrbwzncayf3h632p:DEVCENTER:EXT";
		final String clientSecret= "2dbvVD1E";
		
		//base64 encode clientId and clientSecret
        String encodedClientId = Base64.encodeBase64String((clientId).getBytes());
        String encodedClientSecret = Base64.encodeBase64String((clientSecret).getBytes());

        //Concatenate encoded client and secret strings, separated with colon
        String encodedClientIdSecret = encodedClientId+":"+encodedClientSecret;

        //Convert the encoded concatenated string to a single base64 encoded string.
        encodedClientIdSecret = Base64.encodeBase64String(encodedClientIdSecret.getBytes());
		System.out.println(encodedClientIdSecret);
        
		DSCommHandler dsC = new DSCommHandler();
		String token = dsC.getAuthToken("https://api.test.sabre.com",encodedClientIdSecret);
		String response = dsC.sendRequest("https://api.test.sabre.com/v1/shop/flights?origin="+origin+"&destination="+destination+"&departuredate="+departureDate+"&returndate="+arrivalDate+"&onlineitinerariesonly=N&limit=10&offset=1&eticketsonly=N&sortby=totalfare&order=asc&sortby2=departuretime&order2=asc&pointofsalecountry=US", token);
		//Display the response String
		System.out.println("SDS Response: "+response);
		
		/* Testing themes
		DSCommHandler dsC = new DSCommHandler();
		String token = dsC.getAuthToken("https://api.test.sabre.com",encodedClientIdSecret);
		String response = dsC.sendRequest("https://api.test.sabre.com/v1/lists/supported/shop/themes", token);
		//Display the response String
		System.out.println("SDS Response: "+response);
		*/
		
		//Other Example Calls
		//Call Destination Finder, for flights from Las Vegas and 5 day Length
		//String response2 = dsC.sendRequest("https://api.test.sabre.com/v1/shop/flights/fares?origin=LAS&lengthofstay=5", token);
		//Display the String
		//System.out.println("SDS Response: "+response2);
		
		return response;

	}
}
