package com.example.attapp;

import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class TeacherScan extends Activity implements OnClickListener {
	TextView t_name,result;
	EditText pass;
	Button submit;
	String name,email;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_tscan);
		findViews();
		Bundle bundle = this.getIntent().getExtras();
		name = bundle.getString("name");
		email = bundle.getString("email");
		t_name.setText(name);

		submit.setOnClickListener(this);
	}

	private void findViews()
	{
		t_name=(TextView) findViewById(R.id.tname);
		submit=(Button) findViewById(R.id.submitBtn);
		pass=(EditText) findViewById(R.id.passwrd);	
		result=(TextView) findViewById(R.id.subName);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.teacher_scan, menu);
		return true;
	}

	public void onClick(View view) {
		String url="http://192.168.183.1:8080/EchWebsite/GetSubjects";
		sendRequest task = new sendRequest();
		task.execute(new String[] { url });
	}
	private class sendRequest extends AsyncTask<String, Void, String> {
		@Override
		protected String doInBackground(String... urls) 
		{
			ArrayList<NameValuePair> postParameters = new ArrayList<NameValuePair>();
			postParameters.add(new BasicNameValuePair("email", email.toString()));
			postParameters.add(new BasicNameValuePair("password", pass.getText().toString()));

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


			if(output.charAt(0)=='V')
			{

				//result.setText(output);
				String[] subjs=output.split("#");        	   
				Bundle bundle = new Bundle();
				bundle.putString("name", name);
				bundle.putStringArray("subjects", subjs);
				Intent newIntent = new Intent(TeacherScan.this, SubjectActivity.class);
				newIntent.putExtras(bundle);
				startActivity(newIntent);

			}
			else
				result.setText("Invalid Login Details");
		}

	}

}
