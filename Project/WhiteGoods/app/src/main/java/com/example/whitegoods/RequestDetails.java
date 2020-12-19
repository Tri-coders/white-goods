package com.example.whitegoods;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.whitegoods.fcmservice.FcmTokenReceiver;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class RequestDetails extends AppCompatActivity {

    String requestId, EmpName, req_status;
    String server_url;
    String updaterequest_url;

    TextView rId, rTitle, rDesc, empName, rDate, rTime, cName, cAddress, cCity, cPin;
    TextView cPhone, cEmail, service, itemCost, discount, total;

    JSONObject request;
    ImageButton backButton;
    Button cancle,suspend,reschedule;
    RequestQueue requestQueue;

    SharedPreferences sharedPreferences;
    private static final String SHARED_PREF_NAME = "mypref";
    private static final String KEY_ROLE = "role";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_details);

        server_url = getString(R.string.host_url) + "/request_details";
        updaterequest_url = getString(R.string.host_url) + "/requestUpdate";
        requestQueue = Volley.newRequestQueue(this);

        Intent intent = getIntent();
        requestId = intent.getStringExtra("requestId");
        EmpName = intent.getStringExtra("empName");
        req_status = intent.getStringExtra("req_status");

        setElementId();
        sharedPreferences = getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);

        String urole = sharedPreferences.getString(KEY_ROLE, "1");
        if(urole.equals("2")) {
            reschedule.setVisibility(View.INVISIBLE);
            cancle.setVisibility(View.INVISIBLE);
        }else{
            reschedule.setVisibility(View.VISIBLE);
            cancle.setVisibility(View.VISIBLE);
        }

        //manipulating buttons
        if(req_status.equals("01")) {
            suspend.setEnabled(false);
        } else if(req_status.equals("11")) {
            suspend.setVisibility(View.GONE);
            cancle.setVisibility(View.GONE);
            reschedule.setVisibility(View.GONE);
        }

        backButton();

        parseJSON();

        reschedule.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final JSONObject jsonObject = new JSONObject();
                try {
                    jsonObject.put("type", "10");
                    jsonObject.put("request_id", requestId);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }

                final String requestBody = jsonObject.toString();
                Log.i("VolleyABC", requestBody);

                StringRequest stringRequest = new StringRequest(Request.Method.POST, updaterequest_url, new Response.Listener<String>() {
                    @Override
//                    String title,desc,name,date,time,phone,addr,city,pin,email,disc,totalcost;
//                    Integer charge,cost;
                    public void onResponse(String response) {
                        Toast.makeText(RequestDetails.this, "Logged IN", Toast.LENGTH_SHORT).show();
                        Intent createRequest = new Intent(RequestDetails.this,CreateRequest.class);


                        createRequest.putExtra("from","reschedule");
                        try {
                            createRequest.putExtra("title",request.getString("title"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("desc",request.getString("description"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("name",request.getString("name"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("phone",request.getString("contact"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("email",request.getString("email"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("address",request.getString("address"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("city",request.getString("city"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("pincode",request.getString("pin"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("time",request.getString("time"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("charge",request.getString("service_charge"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("cost",request.getString("item_cost"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("discount",request.getString("discount_percent"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("date",request.getString("date"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            createRequest.putExtra("total",request.getString("total_amount"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
//                        Log.d("requestCheck", "Sanket"+);

                        startActivity(createRequest);
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
                stringRequest.setRetryPolicy(new DefaultRetryPolicy(6000,
                        DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                        DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

                RequestQueue requestQueue = Volley.newRequestQueue(RequestDetails.this);
                requestQueue.add(stringRequest); // get response from server
            }
        });

        cancle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                updateRequest("11");
            }
        });

        suspend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                updateRequest("01");
            }
        });

    }


    private void updateRequest(String type){
        final String[] reason = new String[1];
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Reason");

// Set up the input
        final EditText input = new EditText(this);
// Specify the type of input expected; this, for example, sets the input as a password, and will mask the text
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        builder.setView(input);

// Set up the buttons
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                reason[0] = input.getText().toString();
//                Toast.makeText(RequestDetails.this,input.getText().toString(),Toast.LENGTH_SHORT).show();
                final JSONObject jsonObject = new JSONObject();
                try {
                    jsonObject.put("type", type);
                    jsonObject.put("request_id", requestId);
                    jsonObject.put("reason", reason[0]);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }

                final String requestBody = jsonObject.toString();
                Log.i("VolleyABC", requestBody);

                StringRequest stringRequest = new StringRequest(Request.Method.POST, updaterequest_url, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        if(type.equals("01")){
                            Toast.makeText(RequestDetails.this, "Request Suspend", Toast.LENGTH_SHORT).show();
                        }else{
                            Toast.makeText(RequestDetails.this, "Request Cancelled", Toast.LENGTH_SHORT).show();
                        }
                        finish();
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

                RequestQueue requestQueue = Volley.newRequestQueue(RequestDetails.this);
                requestQueue.add(stringRequest); // get response from server
            }
        });
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });

        builder.show();

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
                    request = new JSONObject(response);

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
        cancle = findViewById(R.id.cancle);
        reschedule= findViewById(R.id.reschedule);
        suspend = findViewById(R.id.suspend);
    }

    private void backButton() {
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }
}