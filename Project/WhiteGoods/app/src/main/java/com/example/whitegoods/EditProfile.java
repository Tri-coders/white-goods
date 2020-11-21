package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class EditProfile extends AppCompatActivity {

    EditText email,name,phone,address,city,pincode, userId;
    CheckBox demo,install,inventory,upgrade;
    Button saveEdit;
    ImageButton editPic;

    ProgressBar progressBar;
    char isDemo,isInstall,isUpgrade,isInventory;
    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";

    String server_url = "http://128.199.30.114:9000/edit_employee_admin";

    String empUserID, imageUrl, empName, empRole, empEmail, empContact, empAddress, empCity, empPin, is_admin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getIntentData();

        if(is_admin.equals("1")){

            setContentView(R.layout.activity_admin_edit_profile);

            userId = findViewById(R.id.user_id);
            email=findViewById(R.id.email_admin);
            name=findViewById(R.id.name_admin);
            phone=findViewById(R.id.phone_admin);
            address=findViewById(R.id.address_admin);
            city=findViewById(R.id.city_admin);
            pincode=findViewById(R.id.pincode_admin);
            demo=findViewById(R.id.demo_admin);
            install=findViewById(R.id.install_admin);
            inventory=findViewById(R.id.inventory_admin);
            upgrade=findViewById(R.id.upgrade_admin);
            editPic = findViewById(R.id.edit_pic);

            setIntentData();

            progressBar=findViewById(R.id.progressBar_admin);
            saveEdit=findViewById(R.id.saveEdit_admin);

            saveEdit.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    try {
                        editAdmin();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            });

        }else{
            setContentView(R.layout.activity_edit_profile);
            ImageButton buttonShow = findViewById(R.id.saveProfile);
            buttonShow.setOnClickListener((View.OnClickListener) view -> {
                BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(
                        EditProfile.this, R.style.BottomSheetDialogTheme
                );

                View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(
                        R.layout.layout_bottom_sheet,
                        (LinearLayout)findViewById(R.id.bottomSheetContainer)
                );
                bottomSheetDialog.setContentView(bottomSheetView);
                bottomSheetDialog.show();
            });
        }

    }

    private void getIntentData() {

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
        is_admin = intent.getStringExtra("is_admin");

    }

    private void setIntentData() {

        userId.setText(empUserID);
        email.setText(empEmail);
        name.setText(empName);
        phone.setText(empContact);
        address.setText(empAddress);
        city.setText(empCity);
        pincode.setText(empPin);
        if(empRole.contains("Install")) {
            install.setChecked(true);
        }
        if(empRole.contains("Inventory")) {
            inventory.setChecked(true);
        }
        if(empRole.contains("Demo")) {
            demo.setChecked(true);
        }
        if(empRole.contains("Upgrade")) {
            upgrade.setChecked(true);
        }

        Picasso.get().load(imageUrl).error(R.drawable.ic_baseline_person_24).into(editPic, new Callback() {
            @Override
            public void onSuccess() {

            }

            @Override
            public void onError(Exception e) {
                Log.i("picasso", "" + e);
            }
        });

    }

    void editAdmin() throws InterruptedException {
        if(demo.isChecked()) {
            isDemo = '1';
        } else {
            isDemo = '0';
        }

        if(install.isChecked()) {
            isInstall = '1';
        } else {
            isInstall = '0';
        }

        if(inventory.isChecked()) {
            isInventory = '1';
        } else {
            isInventory = '0';
        }

        if(upgrade.isChecked()) {
            isUpgrade = '1';
        } else {
            isUpgrade = '0';
        }

        String idText = String.valueOf(userId.getText());
        String nameText = String.valueOf(name.getText());
        String emailText = String.valueOf(email.getText());
        String mobileText = String.valueOf(phone.getText());
        String addressText = String.valueOf(address.getText());
        String cityText = String.valueOf(city.getText());
        String pinText = String.valueOf(pincode.getText());

        progressBar.setVisibility(View.VISIBLE);
        saveEdit.setEnabled(false);
        //regEmployee.setBackgroundColor(Color.parseColor("#0E457A"));

        if(emailText.matches(emailPattern) && emailText.length()>0){
            if(nameText.length()>0){
                if(mobileText.length()==10){
                    if(addressText.length()>0){
                        if(cityText.length()>0){
                            if(pinText.length()==6){
                                if(isDemo=='1' || isInstall=='1' || isInventory=='1' || isUpgrade=='1'){
                                    func(idText,emailText,nameText,mobileText,addressText,cityText,pinText,isDemo,isInstall,isInventory,isUpgrade);
                                }else{
                                    Toast.makeText(EditProfile.this,"Select the Role!!",Toast.LENGTH_SHORT).show();
                                    progressBar.setVisibility(View.INVISIBLE);
                                    saveEdit.setEnabled(true);
                                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                                }
                            }else{
                                Toast.makeText(EditProfile.this,"Enter the Pin-code!!",Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.INVISIBLE);
                                saveEdit.setEnabled(true);
                                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                            }
                        }else{
                            Toast.makeText(EditProfile.this,"Enter the City!!",Toast.LENGTH_SHORT).show();
                            progressBar.setVisibility(View.INVISIBLE);
                            saveEdit.setEnabled(true);
                            //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                        }
                    }else{
                        Toast.makeText(EditProfile.this,"Enter the Address!!",Toast.LENGTH_SHORT).show();
                        progressBar.setVisibility(View.INVISIBLE);
                        saveEdit.setEnabled(true);
                        //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                    }
                }else {
                    Toast.makeText(EditProfile.this, "Enter the Phone number!!", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.INVISIBLE);
                    saveEdit.setEnabled(true);
                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                }
            }else{
                Toast.makeText(EditProfile.this,"Enter the Name!!",Toast.LENGTH_SHORT).show();
                progressBar.setVisibility(View.INVISIBLE);
                saveEdit.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
            }
        }else{
            Toast.makeText(EditProfile.this,"Invalid Email ID!!",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            saveEdit.setEnabled(true);
            //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
        }

    }

    private void func(String idText, String emailText, String nameText, String mobileText, String addressText, String cityText, String pinText, char isDemo, char isInstall, char isInventory, char isUpgrade) {
        Log.i("volleyABC", nameText + " " + emailText + " " + mobileText + " " + addressText + " " + cityText + " " + pinText + " " + isDemo + " " + isInventory + " " + isUpgrade + " " + isInstall);



        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user_id", idText);
            jsonObject.put("name", nameText);
            jsonObject.put("email", emailText);
            jsonObject.put("contact", mobileText);
            jsonObject.put("address", addressText);
            jsonObject.put("city", cityText);
            jsonObject.put("pin", pinText);
            jsonObject.put("install", "" + isInstall);
            jsonObject.put("demo", "" + isDemo);
            jsonObject.put("inventory", "" + isInventory);
            jsonObject.put("upgrade", "" + isUpgrade);

            Log.i("checkdata", jsonObject.toString());
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);

                progressBar.setVisibility(View.INVISIBLE);
                saveEdit.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));

                Toast.makeText(EditProfile.this, "Success", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar.setVisibility(View.INVISIBLE);
                saveEdit.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(EditProfile.this, "Server Error", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(EditProfile.this, "Check Network", Toast.LENGTH_SHORT).show();
                }
            }
        }) {
            //sending JSONObject String to server starts
            @Override
            public byte[] getBody() throws AuthFailureError {
                try {
                    return requestBody.getBytes("utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    return null;
                }
            }

            @Override
            public String getBodyContentType() {
                return "application/json; charset=utf-8";
            }
        };

        stringRequest.setRetryPolicy(new DefaultRetryPolicy(6000,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

        //sending JSONObject String to server ends

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest); // get response from server

    }
}