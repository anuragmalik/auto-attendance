package com.example.echmobn;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class HomeActivity extends Activity {
	String name,uid,email;
	Button profBtn,noteBtn,repBtn,attBtn;
	TextView nameText;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_home);
		
		Bundle bundle = this.getIntent().getExtras();
		name = bundle.getString("name");
		email = bundle.getString("email");
		uid = bundle.getString("uid");
	
		findViews();
		setClicks();
		nameText.setText(name);
	}

	private void findViews()
	{
		profBtn=(Button)findViewById(R.id.profRun);
		noteBtn=(Button)findViewById(R.id.noteRun);
		repBtn=(Button)findViewById(R.id.repRun);
		attBtn=(Button)findViewById(R.id.attRun);
		nameText=(TextView)findViewById(R.id.userName);
	}
	
	private void setClicks()
	{
		Bundle bundle = new Bundle();
        bundle.putString("uid",uid);
        
		profBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				Bundle bundle = new Bundle();
		        bundle.putString("uid",uid);
		         Intent newIntent = new Intent(HomeActivity.this, ProfileActivity.class);
		         newIntent.putExtras(bundle);
		         startActivity(newIntent); 
			}});
		
		repBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				Bundle bundle = new Bundle();
		        bundle.putString("uid",uid);
		         Intent newIntent = new Intent(HomeActivity.this, ReqActivity.class);
		         newIntent.putExtras(bundle);
		         startActivity(newIntent); 
			}});
		
		attBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				Bundle bundle = new Bundle();
		        bundle.putString("uid",uid);
		         Intent newIntent = new Intent(HomeActivity.this, AttActivity.class);
		         newIntent.putExtras(bundle);
		         startActivity(newIntent); 
			}});
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.home, menu);
		return true;
	}

}
