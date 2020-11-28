package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
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

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.TimeUnit;

public class RegisterEmployee extends AppCompatActivity {

    EditText name, email, mobile, address, city, pin;
    CheckBox demo, install, upgrade, inventory;
    char isDemo, isInstall, isUpgrade, isInventory;
    Button regEmployee;
    ProgressBar progressBar;

    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";

    String server_url = getString(R.string.host_url) + "/register";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_employee);

        name = findViewById(R.id.name);
        email = findViewById(R.id.email);
        mobile = findViewById(R.id.mobile);
        address = findViewById(R.id.address);
        city = findViewById(R.id.city);
        pin = findViewById(R.id.pincode);

        demo = findViewById(R.id.demo);
        install = findViewById(R.id.install);
        inventory = findViewById(R.id.inventory);
        upgrade = findViewById(R.id.upgrade);

        progressBar = findViewById(R.id.progressBar_register_page);

        regEmployee = findViewById(R.id.register_emp);
        regEmployee.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    registerEmployee();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });

    }

    private void registerEmployee() throws InterruptedException {
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

        String nameText = String.valueOf(name.getText());
        String emailText = String.valueOf(email.getText());
        String mobileText = String.valueOf(mobile.getText());
        String addressText = String.valueOf(address.getText());
        String cityText = String.valueOf(city.getText());
        String pinText = String.valueOf(pin.getText());

        progressBar.setVisibility(View.VISIBLE);
        regEmployee.setEnabled(false);
        //regEmployee.setBackgroundColor(Color.parseColor("#0E457A"));

        if(emailText.matches(emailPattern) && emailText.length()>0){
            if(nameText.length()>0){
                if(mobileText.length()==10){
                    if(addressText.length()>0){
                        if(cityText.length()>0){
                            if(pinText.length()==6){
                                if(isDemo=='1' || isInstall=='1' || isInventory=='1' || isUpgrade=='1'){
                                    func(emailText,nameText,mobileText,addressText,cityText,pinText,isDemo,isInstall,isInventory,isUpgrade);
                                }else{
                                    Toast.makeText(RegisterEmployee.this,"Select the Role!!",Toast.LENGTH_SHORT).show();
                                    progressBar.setVisibility(View.INVISIBLE);
                                    regEmployee.setEnabled(true);
                                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                                }
                            }else{
                                Toast.makeText(RegisterEmployee.this,"Enter the Pin-code!!",Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.INVISIBLE);
                                regEmployee.setEnabled(true);
                                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                            }
                        }else{
                            Toast.makeText(RegisterEmployee.this,"Enter the City!!",Toast.LENGTH_SHORT).show();
                            progressBar.setVisibility(View.INVISIBLE);
                            regEmployee.setEnabled(true);
                            //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                        }
                    }else{
                        Toast.makeText(RegisterEmployee.this,"Enter the Address!!",Toast.LENGTH_SHORT).show();
                        progressBar.setVisibility(View.INVISIBLE);
                        regEmployee.setEnabled(true);
                        //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                    }
                }else {
                    Toast.makeText(RegisterEmployee.this, "Enter the Phone number!!", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.INVISIBLE);
                    regEmployee.setEnabled(true);
                    //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                }
            }else{
                Toast.makeText(RegisterEmployee.this,"Enter the Name!!",Toast.LENGTH_SHORT).show();
                progressBar.setVisibility(View.INVISIBLE);
                regEmployee.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
            }
        }else{
            Toast.makeText(RegisterEmployee.this,"Invalid Email ID!!",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            regEmployee.setEnabled(true);
            //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
        }

        }

    private void func(String emailText, String nameText, String mobileText, String addressText, String cityText, String pinText, char isDemo, char isInstall, char isInventory, char isUpgrade) {
        Log.i("volleyABC", nameText + " " + emailText + " " + mobileText + " " + addressText + " " + cityText + " " + pinText + " " + isDemo + " " + isInventory + " " + isUpgrade + " " + isInstall);



        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("name", nameText);
            jsonObject.put("email", emailText);
            jsonObject.put("mobile", mobileText);
            jsonObject.put("address", addressText);
            jsonObject.put("city", cityText);
            jsonObject.put("pincode", pinText);
            jsonObject.put("install", "" + isInstall);
            jsonObject.put("demo", "" + isDemo);
            jsonObject.put("inventory", "" + isInventory);
            jsonObject.put("upgrade", "" + isUpgrade);
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
                regEmployee.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));

                Toast.makeText(RegisterEmployee.this, "Success", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                progressBar.setVisibility(View.INVISIBLE);
                regEmployee.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(RegisterEmployee.this, "Server Error", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(RegisterEmployee.this, "Check Network", Toast.LENGTH_SHORT).show();
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