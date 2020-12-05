package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class RequestDetails extends AppCompatActivity {

    String requestId, EmpName;
    String server_url;

    TextView rId, rTitle, rDesc, empName, rDate, rTime, cName, cAddress, cCity, cPin;
    TextView cPhone, cEmail, service, itemCost, discount, total;

    RequestQueue requestQueue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_details);

        server_url = getString(R.string.host_url) + "/request_details";

        requestQueue = Volley.newRequestQueue(this);

        Intent intent = getIntent();
        requestId = intent.getStringExtra("requestId");
        EmpName = intent.getStringExtra("empName");

        setElementId();

        parseJSON();

    }

    private void parseJSON() {

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("request_id", requestId);
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
                try {
                    JSONObject request = new JSONObject(response);

                    rId.setText("Id: "+request.getString("request_id"));
                    rTitle.setText("Title: "+request.getString("title"));
                    rDesc.setText("Description: "+request.getString("description"));
                    empName.setText(EmpName);
                    rDate.setText(request.getString("date"));
                    rTime.setText(request.getString("time"));
                    cName.setText("Name: "+request.getString("name"));
                    cAddress.setText("Address: "+request.getString("address"));
                    cCity.setText("City: "+request.getString("city"));
                    cPin.setText("Pincode: "+request.getString("pin"));
                    cPhone.setText("Phone: "+request.getString("contact"));
                    cEmail.setText("Email id: "+request.getString("email"));
                    service.setText("Service Charge: ₹"+request.getString("service_charge"));
                    itemCost.setText("Item Cost: ₹"+request.getString("item_cost"));
                    discount.setText("Discount: "+request.getString("discount_percent")+"%");
                    total.setText("Total Cost: ₹"+request.getString("total_amount"));
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(RequestDetails.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(RequestDetails.this, "Check Network", Toast.LENGTH_SHORT).show();
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
        //sending JSONObject String to server ends

        requestQueue.add(stringRequest); // get response from server

    }

    private void setElementId() {
        rId = findViewById(R.id.rId);
        rTitle = findViewById(R.id.rTitle);
        rDesc = findViewById(R.id.rDesc);
        empName = findViewById(R.id.emp_name);
        rDate = findViewById(R.id.rDate);
        rTime = findViewById(R.id.rTime);
        cName = findViewById(R.id.cName);
        cAddress = findViewById(R.id.cAddress);
        cCity = findViewById(R.id.cCity);
        cPin = findViewById(R.id.cPin);
        cPhone = findViewById(R.id.cContact);
        cEmail = findViewById(R.id.cEmail);
        service = findViewById(R.id.service);
        itemCost = findViewById(R.id.item_cost);
        discount = findViewById(R.id.discount);
        total = findViewById(R.id.total_amount);
    }
}