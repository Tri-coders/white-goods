package com.example.whitegoods;

import androidx.annotation.DrawableRes;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.media.Image;
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

    int save_or_edit = 0; // 0 = view state, 1 = edit state

    EditText email,name,phone,address,city,pincode, userId;
    CheckBox demo,install,inventory,upgrade;
    ImageButton saveEditTop;
    Button saveEditBottom, delEmployee;
    ImageButton editPic;

    ProgressBar progressBar;
    char isDemo,isInstall,isUpgrade,isInventory;
    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";

    String server_url_edit;
    String server_url_delete;

    String empUserID, imageUrl, empName, empRole, empEmail, empContact, empAddress, empCity, empPin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        server_url_edit = getString(R.string.host_url) + "/edit_employee_admin";
        server_url_delete = getString(R.string.host_url) + "/del_employee";

        getIntentData();

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
        saveEditBottom=findViewById(R.id.saveEdit_admin);
        saveEditTop = findViewById(R.id.saveProfile);
        delEmployee = findViewById(R.id.delete);

        delEmployee.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deleteEmployee();
            }
        });

        saveEditTop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saveEditBottom.performClick();
            }
        });

        saveEditBottom.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(save_or_edit == 0) {
                    saveEditBottom.setText("Save");
                    save_or_edit = 1;

                    userId.setEnabled(true);
                    email.setEnabled(true);
                    name.setEnabled(true);
                    phone.setEnabled(true);
                    address.setEnabled(true);
                    city.setEnabled(true);
                    pincode.setEnabled(true);
                    demo.setEnabled(true);
                    install.setEnabled(true);
                    inventory.setEnabled(true);
                    upgrade.setEnabled(true);

                    saveEditTop.setBackgroundResource(R.drawable.ic_baseline_save_24);

                } else {
                    saveEditBottom.setText("Edit");
                    save_or_edit = 0;

                    userId.setEnabled(false);
                    email.setEnabled(false);
                    name.setEnabled(false);
                    phone.setEnabled(false);
                    address.setEnabled(false);
                    city.setEnabled(false);
                    pincode.setEnabled(false);
                    demo.setEnabled(false);
                    install.setEnabled(false);
                    inventory.setEnabled(false);
                    upgrade.setEnabled(false);

                    saveEditTop.setBackgroundResource(R.drawable.ic_baseline_edit_24);

                    try {
                        editAdmin();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    private void deleteEmployee() {
        Log.i("volleyABC", "id: - " + empUserID);



        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user_id", empUserID);

            Log.i("checkdata", jsonObject.toString());
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url_delete, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);

                finish();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
//                progressBar.setVisibility(View.INVISIBLE);
//                saveEditBottom.setEnabled(true);
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
        saveEditBottom.setEnabled(false);
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
                                    saveEditBottom.setEnabled(true);
                                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                                }
                            }else{
                                Toast.makeText(EditProfile.this,"Enter the Pin-code!!",Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.INVISIBLE);
                                saveEditBottom.setEnabled(true);
                                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                            }
                        }else{
                            Toast.makeText(EditProfile.this,"Enter the City!!",Toast.LENGTH_SHORT).show();
                            progressBar.setVisibility(View.INVISIBLE);
                            saveEditBottom.setEnabled(true);
                            //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                        }
                    }else{
                        Toast.makeText(EditProfile.this,"Enter the Address!!",Toast.LENGTH_SHORT).show();
                        progressBar.setVisibility(View.INVISIBLE);
                        saveEditBottom.setEnabled(true);
                        //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                    }
                }else {
                    Toast.makeText(EditProfile.this, "Enter the Phone number!!", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.INVISIBLE);
                    saveEditBottom.setEnabled(true);
                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                }
            }else{
                Toast.makeText(EditProfile.this,"Enter the Name!!",Toast.LENGTH_SHORT).show();
                progressBar.setVisibility(View.INVISIBLE);
                saveEditBottom.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
            }
        }else{
            Toast.makeText(EditProfile.this,"Invalid Email ID!!",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            saveEditBottom.setEnabled(true);
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

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url_edit, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);

                progressBar.setVisibility(View.INVISIBLE);
                saveEditBottom.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));

                Toast.makeText(EditProfile.this, "Success", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar.setVisibility(View.INVISIBLE);
                saveEditBottom.setEnabled(true);
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