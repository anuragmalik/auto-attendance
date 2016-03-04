package com.example.echmobn;

import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.webkit.WebView;

public class AttActivity extends Activity {
	String uid,chart="",finalData="";
	WebView web;
	int cc=0;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_att);
		Bundle bundle = this.getIntent().getExtras();
		uid = bundle.getString("uid");
		web=(WebView)findViewById(R.id.attView);
		chart="AttChart";
		fetchAttendance(chart);
	}
	private void fetchAttendance(String Chart)
	{
		String URL="http://192.168.183.1:8080/EchWebsite/"+chart;
        sendRequest task = new sendRequest();
        task.execute(new String[] { URL });
	}
	private class sendRequest extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls) 
        {
        	ArrayList<NameValuePair> postParameters = new ArrayList<NameValuePair>();
           postParameters.add(new BasicNameValuePair("uid", uid.trim()));
            String response = null;
            String res= null;
            for (String url : urls) {
            try {
                response = CustomHttpClient.executeHttpPost(url, postParameters);
            } catch (Exception e) {
                
            }}

            return response;
        }
        
        protected void onPostExecute(String output) {
        	if(cc==0)
        	{finalData +=output;
        		chart="AttChartMonth";
        		cc=1;
        		fetchAttendance(chart);}
        	else if(cc==1) { finalData +=output;
        		chart="AttChartSem";
        		cc++;
        		fetchAttendance(chart);}
        	else if(cc==2){
        		finalData +=output;
        	web.loadData(finalData, "text/html", "UTF-8");
        	}
        }
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.att, menu);
		return true;
	}

}
