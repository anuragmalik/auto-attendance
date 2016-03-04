package com.example.echmobn;

import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class LoginActivity extends Activity implements OnClickListener {
	Button vbutton;
    TextView dispName,resVer,hidden;
    EditText un,pw;
    String from, name, email;
    AlertDialog.Builder alert;
    Bundle bundle;
    public static String URL = null;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_login);

		
		findViewsById();
		getBundle();
		
		 alert  = new AlertDialog.Builder(LoginActivity.this);
		 alert.setCancelable(true);
		 
	      vbutton.setOnClickListener(this);
	}

	private void getBundle(){
		bundle = this.getIntent().getExtras();
		from = bundle.getString("from");
		if(from.equalsIgnoreCase("auto"))
		{name = bundle.getString("name");
		//uid = bundle.getString("Uid");
		email = bundle.getString("email");
		hidden.setVisibility(View.VISIBLE);
		dispName.setText("Hello");
		hidden.setText(name);
		}
		else
		{
		un.setVisibility(View.VISIBLE);
	    dispName.setText("Enter User Name :");
		}
			
	}
	private void findViewsById() {
		vbutton = (Button) findViewById(R.id.verButton);
        dispName = (TextView) findViewById(R.id.usnLine);
        un=(EditText)findViewById(R.id.unBox);
        pw=(EditText)findViewById(R.id.passBox);
        hidden = (TextView) findViewById(R.id.hiddenName);
        resVer = (TextView) findViewById(R.id.resVerify);
        
	}
 
	 public void onClick(View view) {
		 if(pw.getText().length()<5)
		 {resVer.setText("Invalid Password");}
		 else{
		 URL="http://192.168.183.1:8080/EchWebsite/AndroidLogin";
         sendRequest task = new sendRequest();
         task.execute(new String[] { URL }); }
     }
  
     private class sendRequest extends AsyncTask<String, Void, String> {
         @Override
         protected String doInBackground(String... urls) 
         {
         	ArrayList<NameValuePair> postParameters = new ArrayList<NameValuePair>();
            if(from.equalsIgnoreCase("auto"))
         	{postParameters.add(new BasicNameValuePair("email", email));
         	}
            else
            postParameters.add(new BasicNameValuePair("email", un.getText().toString()));
            
            postParameters.add(new BasicNameValuePair("password", pw.getText().toString()));
             String response = null;
             String res= null;
             for (String url : urls) {
             try {
                 response = CustomHttpClient.executeHttpPost(url, postParameters);
             } catch (Exception e) {
                 resVer.setText(e.toString());
             }}

             return response;
         }
         
         protected void onPostExecute(String output) {
             if(output.startsWith("I"))
             {resVer.setText("Invalid Login Details");}
             else
             {
            	gotoHome(output); 
             }
         }
 }
     private void gotoHome(String data)
     {   
    	 
    	// resVer.setText(data);
    	 Bundle bundle = new Bundle();
         bundle.putString("name",name);
         bundle.putString("email",email);
         bundle.putString("uid",data);
         Intent newIntent = new Intent(LoginActivity.this, HomeActivity.class);
         newIntent.putExtras(bundle);
         startActivity(newIntent);
     }

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.login, menu);
		return true;
	}

}
