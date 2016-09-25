package com.example.echmobn;

import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.Button;

public class MainActivity extends Activity {
	Button mbutton,sbutton;
	int call=0;
	AlertDialog.Builder alert;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		findViewsById();
		alert  = new AlertDialog.Builder(MainActivity.this);
		alert.setCancelable(true);
		mbutton.setOnClickListener(new View.OnClickListener() {        
			public void onClick(View view) { call=1;  callNextActivity();}});
		sbutton.setOnClickListener(new View.OnClickListener() {        
			public void onClick(View view) {call=0; callNextActivity();}});
	}

	private void findViewsById() {
		mbutton = (Button) findViewById(R.id.m_login);
		sbutton = (Button) findViewById(R.id.s_login);
	}

	private void callNextActivity() {

		if( call==1){

			Bundle bundle = new Bundle();
			bundle.putString("from","manual"); 
			Intent newIntent = new Intent(MainActivity.this, LoginActivity.class);
			newIntent.putExtras(bundle);
			startActivity(newIntent);
		}
		else
		{

			try
			{
				Intent intent = new Intent("com.google.zxing.client.android.SCAN");
				intent.setPackage("com.google.zxing.client.android");
				intent.putExtra("com.google.zxing.client.android.SCAN.SCAN_MODE", "QR_CODE_MODE");
				startActivityForResult(intent, 0);
			}
			catch(Exception e)
			{
				alert.setTitle("Info");
				alert.setMessage("Barcode Reader is not installed.\n " +
						"Please install free Barcode Scanner Application from Android market, provided by ZXING Team.");
				alert.setPositiveButton("OK", null);
				alert.show();
			}
		}


	}

	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		if (requestCode == 0) {
			if (resultCode == RESULT_OK) {
				String data = intent.getStringExtra("SCAN_RESULT");
				String[] ss=data.split("#");
				Bundle bundle = new Bundle();
				bundle.putString("from", "auto");
				bundle.putString("name",ss[0]);
				bundle.putString("email",ss[2].trim());
				Intent newIntent = new Intent(MainActivity.this, LoginActivity.class);
				newIntent.putExtras(bundle);
				startActivity(newIntent);

			} else if (resultCode == RESULT_CANCELED) {
				alert.setTitle("Failed !");
				alert.setMessage("Failed to Scan. Try Again");
				alert.setPositiveButton("OK", null);
				alert.show();
			}
		}}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
