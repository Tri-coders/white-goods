package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;

public class AdminViewEmployeeProfile extends AppCompatActivity {

    ImageView imageView;
    TextView userId, nameBold, name, roleTop, role, email, contact, address, city, pinCode;
    LinearLayout roleBox;
    ImageButton editProfile;

    String empUserID, imageUrl, empName, empRole, empEmail, empContact, empAddress, empCity, empPin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_profile);

        imageView = findViewById(R.id.empProfile);

        editProfile = findViewById(R.id.edit_profile);

        userId = findViewById(R.id.user_id) ;
        nameBold = findViewById(R.id.name_emp);
        name = findViewById(R.id.name);
        roleTop = findViewById(R.id.empRole);
        role = findViewById(R.id.role);
        email = findViewById(R.id.email);
        contact = findViewById(R.id.contact);
        address = findViewById(R.id.address);
        city = findViewById(R.id.city);
        pinCode = findViewById(R.id.pin);

        roleBox = findViewById(R.id.roleBox);

        setData();

        editData();
    }

    private void editData() {

        editProfile.setOnClickListener(view -> {
            Intent editP = new Intent(this, EditProfile.class);

            editP.putExtra("userId", empUserID);
            editP.putExtra("imageUrl", imageUrl);
            editP.putExtra("empName", empName);
            editP.putExtra("empRole", empRole);
            editP.putExtra("email", empEmail);
            editP.putExtra("phone", empContact);
            editP.putExtra("address", empAddress);
            editP.putExtra("city", empCity);
            editP.putExtra("pinCode", empPin);

            editP.putExtra("is_admin", "1");

            startActivity(editP);
        });

    }

    private void setData() {
        Intent intent = getIntent();

        empUserID = intent.getStringExtra("userId");
        imageUrl = intent.getStringExtra("imageUrl");
        empName = intent.getStringExtra("empName");
        empRole = intent.getStringExtra("empRole");
        empEmail = intent.getStringExtra("email");
        empContact = intent.getStringExtra("phone");
        empAddress = intent.getStringExtra("address");
        empCity = intent.getStringExtra("city");
        empPin = intent.getStringExtra("pinCode");

        Log.i("sankyABC", imageUrl);

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
        if(empRole.equals("Manager")) {
            roleTop.setText("Manager");
            roleBox.setVisibility(View.GONE);
        } else {
            roleTop.setText("Employee");
        }

        email.setText(empEmail);
        contact.setText(empContact);
        address.setText(empAddress);
        city.setText(empCity);
        pinCode.setText(empPin);
    }
}