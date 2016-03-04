package com.example.attapp;


import java.util.ArrayList;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class SubjectActivity extends Activity {
    String tname;
    String[] sub;
    ListView Sub_List;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_subject);
		Bundle bundle = this.getIntent().getExtras();
		tname = bundle.getString("name");
		sub = bundle.getStringArray("subjects");
        findViews();
        createList(sub);
	}

	private void findViews()
	{
		Sub_List=(ListView) findViewById(R.id.subList);

	}
	
	private void createList(String[] sub)
	{
		ArrayList<String> noteList = new ArrayList<String>();
        for(int i=1;i<=sub.length-1;i++)
		noteList.add(sub[i]);
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this,R.layout.list_item, noteList);
		Sub_List.setAdapter(arrayAdapter);
		
		Sub_List.setOnItemClickListener(new OnItemClickListener() {
	          public void onItemClick(AdapterView<?> parent, View view,int position, long id) {
	 
	              // selected item
	              String subject = ((TextView) view).getText().toString().trim();
	 
	              // Launching new Activity on selecting single List Item
	              Intent i = new Intent(getApplicationContext(), ClassActivity.class);
	              // sending data to new activity
	              Bundle bundle = new Bundle();
		            bundle.putString("name",tname);
		            bundle.putString("subject",subject);
	              i.putExtras(bundle);
	              startActivity(i);
	 
	          }
	        });
	}
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.subject, menu);
		return true;
	}

}
