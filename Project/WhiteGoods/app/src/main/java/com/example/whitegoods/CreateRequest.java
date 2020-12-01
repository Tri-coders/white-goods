package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ImageButton;

public class CreateRequest extends AppCompatActivity {
    ImageButton backButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_request);
        backButton();
    }

    private void backButton(){
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }

}