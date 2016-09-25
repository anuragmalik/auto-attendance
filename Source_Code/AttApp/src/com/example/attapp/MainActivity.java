package com.example.attapp;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
	Button start;
	AlertDialog.Builder alert;
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		alert  = new AlertDialog.Builder(MainActivity.this);
		alert.setCancelable(true);
		start=(Button) findViewById(R.id.submitBtn);
		start.setOnClickListener(new View.OnClickListener() {        
			@Override
			public void onClick(View view) {
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
					alert.setMessage("Barcode Reader is not installed.\nPlease install free  " +
							"Barcode Scanner Application from Android market,provided by ZXING Team.");
					alert.setPositiveButton("OK", null);
					alert.show();
				}
			}
		}); 
	}

	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		if (requestCode == 0) {
			if (resultCode == RESULT_OK) {
				String data = intent.getStringExtra("SCAN_RESULT");
				// String format = intent.getStringExtra("SCAN_RESULT_FORMAT");
				String[] ss=data.split("#");
				Bundle bundle = new Bundle();
				bundle.putString("name",ss[0]);
				bundle.putString("email",ss[1].trim());

				Intent newIntent = new Intent(this.getApplicationContext(), TeacherScan.class);
				newIntent.putExtras(bundle);
				startActivity(newIntent);

			} else if (resultCode == RESULT_CANCELED) {
				alert.setTitle("Failed !");
				alert.setMessage("Failed to Scan Successfully. Try Again");
				alert.setPositiveButton("OK", null);
				alert.show();
			}
		}
	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}

