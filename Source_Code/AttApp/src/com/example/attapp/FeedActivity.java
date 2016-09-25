package com.example.attapp;

import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.Menu;
import android.view.View;
import android.widget.TextView;

public class FeedActivity extends Activity {
	String sub,present;
	TextView result,time;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_feed);
		
		Bundle bundle = this.getIntent().getExtras();
		present = bundle.getString("present");
		sub = bundle.getString("subject");
        findViews();
		
		String url="http://192.168.183.1:8080/EchWebsite/UpdateAttendance";
        sendRequest task = new sendRequest();
        task.execute(new String[] { url });
        
        MyCount count=new MyCount(50000, 1000);
		count.start();
	}
	
	private void findViews()
	{
		result=(TextView) findViewById(R.id.resText);
		time=(TextView) findViewById(R.id.timer);
	}
	
	class MyCount extends CountDownTimer{
	    public MyCount(long millisInFuture, long countDownInterval) {
	        super(millisInFuture, countDownInterval);
	        }
	    @Override
	    public void onFinish() {
	    	
	    	Intent newIntent = new Intent(FeedActivity.this, MainActivity.class);
            startActivity(newIntent);
	    		 		
	    }

	    @Override
	    public void onTick(long millisUntilFinished) 
	    { time.setText(formatTime(millisUntilFinished));   }
	    
	    public String formatTime(long millis) {  
	        String output = "00:00";  
	        long seconds = millis / 1000;  
	        long minutes = seconds / 60;  

	        seconds = seconds % 60;  
	        minutes = minutes % 60;  

	        String sec = String.valueOf(seconds);  
	        String min = String.valueOf(minutes);  

	        if (seconds < 10)  
	            sec = "0" + seconds;  
	        if (minutes < 10)  
	            min= "0" + minutes;  

	        output = min + " : " + sec;  
	        return output;
	    }
	}
	
	private class sendRequest extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls) 
        {
        	ArrayList<NameValuePair> postParameters = new ArrayList<NameValuePair>();
            postParameters.add(new BasicNameValuePair("subject", sub));
            postParameters.add(new BasicNameValuePair("UIDs", present));

            String response = null;
            for (String url : urls) {
            try {
            	
                response = CustomHttpClient.executeHttpPost(url, postParameters);
            } catch (Exception e) {
                result.setText(e.toString());
            }}

            return response;
        }
        
        protected void onPostExecute(String output) {
        	result.setText(output);
           }
        }
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.feed, menu);
		return true;
	}

}
