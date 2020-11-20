package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;

public class AdminViewEmployeeProfile extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_profile);

        Intent intent = getIntent();
        String empUserID = intent.getStringExtra("userId");
        String imageUrl = intent.getStringExtra("imageUrl");
        String empName = intent.getStringExtra("empName");
        String empRole = intent.getStringExtra("empRole");
        String empEmail = intent.getStringExtra("email");
        String empContact = intent.getStringExtra("phone");
        String empAddress = intent.getStringExtra("address");
        String empCity = intent.getStringExtra("city");
        String empPin = intent.getStringExtra("pinCode");

        Log.i("sankyABC", imageUrl);

        TextView userId = findViewById(R.id.user_id) ;
        ImageView imageView = findViewById(R.id.empProfile);
        TextView nameBold = findViewById(R.id.name_emp);
        TextView name = findViewById(R.id.name);
        TextView roleTop = findViewById(R.id.empRole);
        TextView role = findViewById(R.id.role);
        TextView email = findViewById(R.id.email);
        TextView contact = findViewById(R.id.contact);
        TextView address = findViewById(R.id.address);
        TextView city = findViewById(R.id.city);
        TextView pinCode = findViewById(R.id.pin);

        Picasso.get().load(imageUrl).error(R.drawable.ic_baseline_person_24).into(imageView, new Callback() {
            @Override
            public void onSuccess() {

            }

            @Override
            public void onError(Exception e) {
                Log.i("picasso", "" + e);
            }
        });

        userId.setText(empUserID);
        nameBold.setText(empName);
        name.setText(empName);
        role.setText(empRole);
        roleTop.setText(empRole);
        email.setText(empEmail);
        contact.setText(empContact);
        address.setText(empAddress);
        city.setText(empCity);
        pinCode.setText(empPin);
    }
}