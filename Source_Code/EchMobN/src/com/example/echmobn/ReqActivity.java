package com.example.echmobn;

import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.webkit.WebView;

public class ReqActivity extends Activity {
	String uid;
	WebView web;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_status);
		Bundle bundle = this.getIntent().getExtras();
		uid = bundle.getString("uid");
		web=(WebView)findViewById(R.id.reqView);
		
		fetchRequest();
	}
	private void fetchRequest()
	{
		String URL="http://192.168.183.1:8080/EchWebsite/AndroidRequest";
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
        	web.loadData(output, "text/html", "UTF-8");
            
        }
}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.status, menu);
		return true;
	}

}
