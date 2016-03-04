package com.example.attapp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

public class ClassActivity extends Activity implements OnClickListener {
	String tname;
	String sub;
	String present="#";
	TextView teacher,subject,time,timer;
	Button end;
	AlertDialog.Builder alert;
	ListView N_List;
	ArrayList<String> nameList;
	ArrayAdapter<String> arrayAdapter;
	int stopScan=0;
	ArrayList presStud;

	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_class);

		Bundle bundle = this.getIntent().getExtras();
		tname = bundle.getString("name").trim();
		sub = bundle.getString("subject").trim();
		findViews();

		teacher.setText(tname);
		subject.setText(sub);

		Calendar c = Calendar.getInstance();

		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss dd-MM-yyyy");
		String currentTime = df.format(c.getTime());
		time.setText(currentTime);
		nameList = new ArrayList<String>();
		presStud=new ArrayList<String>();
		end.setOnClickListener(this);

		MyCount count=new MyCount(15000,1000);
		count.start();
		ScannerMethod();
	}

	class MyCount extends CountDownTimer{
		public MyCount(long millisInFuture, long countDownInterval) {
			super(millisInFuture, countDownInterval);
		}
		@Override
		public void onFinish() {		
			stopScan=1;
			showEnd();
		}

		@Override
		public void onTick(long millisUntilFinished) {    }

		private void showEnd()
		{	

			end.setVisibility(View.VISIBLE);

			//delete method
			N_List.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
				@Override
				public boolean onItemLongClick(AdapterView<?> av, View v, int pos, long id) {
					return onLongListItemClick(v,pos,id);
				}
				protected boolean onLongListItemClick(View v, final int pos, long id) {
					final String str=N_List.getItemAtPosition(pos).toString();
					Log.i("ListView", "onLongListItemClick stirng=" + str);
					AlertDialog.Builder builder = new  
							AlertDialog.Builder(ClassActivity.this);
					builder.setMessage("Are you sure you want to delete -\n" +nameList.get(pos)+" ?")
					.setCancelable(false)
					.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int id) {
							nameList.remove(pos);
							presStud.remove(pos);
							arrayAdapter.notifyDataSetChanged();
						}
					})
					.setNegativeButton("No", new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int id) {
							dialog.cancel();
						}
					});
					AlertDialog alert = builder.create();
					alert.show();
					return true;
				}

			});
			//ends here
		}
	}

	private void ScannerMethod()
	{
		this.runOnUiThread(scanner);
	}
	private Runnable scanner= new Runnable() {
		@Override
		public void run() {
			try
			{
				Intent intent = new Intent("com.google.zxing.client.android.SCAN");
				intent.setPackage("com.google.zxing.client.android");
				intent.putExtra("com.google.zxing.client.android.SCAN.SCAN_MODE", "QR_CODE_MODE");
				startActivityForResult(intent, 0);
			}
			catch(Exception e)
			{
				alert=new AlertDialog.Builder(ClassActivity.this);
				alert.setCancelable(true);
				alert.setTitle("Failed to read UID");
				alert.setMessage("Try Again");
				alert.show();
			}
		}};

		@SuppressWarnings({ "unchecked", "rawtypes" })
		public void onActivityResult(int requestCode, int resultCode, Intent intent) {
			if (requestCode == 0) {
				if (resultCode == RESULT_OK) {
					String feed = intent.getStringExtra("SCAN_RESULT").trim();
					String[] data=feed.split("#");
					nameList.add(data[0] +" (" +data[1].trim()+")");
					presStud.add(data[1].trim());

					//present +=data[1].trim()+"#";

					try {
						Uri notification = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
						Ringtone r = RingtoneManager.getRingtone(getApplicationContext(), notification);
						r.play();
					} catch (Exception e) {}

					if(stopScan!=1) ScannerMethod();
					else
					{
						LinkedHashSet hs = new LinkedHashSet<String>(nameList);
						nameList.clear();
						nameList.addAll(hs);
						
						LinkedHashSet hsp = new LinkedHashSet<String>(presStud);
						presStud.clear();
						presStud.addAll(hsp);

						arrayAdapter = new ArrayAdapter<String>(this,R.layout.list_item, nameList);
						N_List.setAdapter(arrayAdapter);
					}


				} else if (resultCode == RESULT_CANCELED) {
					alert.setTitle("Please scan again..");
				}


			}}
		private void findViews()
		{
			teacher=(TextView) findViewById(R.id.teachName);
			subject=(TextView) findViewById(R.id.subjName);
			time=(TextView) findViewById(R.id.time);
			N_List=(ListView) findViewById(R.id.nameList);
			end=(Button) findViewById(R.id.finishBtn);
		}


		public boolean onCreateOptionsMenu(Menu menu) {
			getMenuInflater().inflate(R.menu.trade, menu);
			return true;
		}

		@SuppressWarnings("unchecked")
		public void onClick(View view) {

			Iterator<String> iterator = presStud.iterator();
			while (iterator.hasNext())
			{present +=iterator.next().trim().toString()+"#";}

			Bundle bundle = new Bundle();
			bundle.putString("present",present);
			bundle.putString("subject",sub);

			Intent newIntent = new Intent(this.getApplicationContext(), FeedActivity.class);
			newIntent.putExtras(bundle);
			startActivity(newIntent);
			finish();
		}

}