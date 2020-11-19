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
        String imageUrl = intent.getStringExtra("imageUrl");
        String empName = intent.getStringExtra("empName");
        String empRole = intent.getStringExtra("empRole");

        Log.i("sankyABC", imageUrl);
        Log.i("sankyABC", imageUrl);
        Log.i("sankyABC", imageUrl);

        ImageView imageView = findViewById(R.id.empProfile);
        TextView name = findViewById(R.id.name_emp);
        TextView role = findViewById(R.id.role);

        Picasso.get().load(imageUrl).error(R.drawable.ic_baseline_person_24).into(imageView, new Callback() {
            @Override
            public void onSuccess() {

            }

            @Override
            public void onError(Exception e) {
                Log.i("picasso", "" + e);
            }
        });
        name.setText(empName);
        role.setText(empRole);
    }
}