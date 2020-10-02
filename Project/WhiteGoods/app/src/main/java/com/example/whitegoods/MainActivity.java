package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    private Button login;
    private EditText email, password;
    private static String server_url = "http://128.199.30.114:9000/login";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        email = findViewById(R.id.view_email_login);
        password = findViewById(R.id.view_password_login);
        login = findViewById(R.id.login);

        login.setOnClickListener(view -> loginUser());
    }

    public void loginUser() {
//        Intent i = new Intent(this, RegisterEmployee.class);
//        startActivity(i);
        Log.i("sankey", "login clicked");
//        login.setVisibility(View.GONE);

        final String email = this.email.getText().toString();
        final String password = this.password.getText().toString();

        func(email, password);
//        login.setVisibility(View.VISIBLE);
    }

    private void func(String email, String password) {
        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("email", email);
            jsonObject.put("password", password);
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
                Toast.makeText(MainActivity.this, "Logged IN", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(MainActivity.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(MainActivity.this, "Check Network", Toast.LENGTH_SHORT).show();
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

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest); // get response from server
    }

    private void func1(String email, String password) {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url,
                response -> {

                    //Toast.makeText(getApplicationContext(),response,Toast.LENGTH_LONG).show();
                    if (response.equals("ok")) {
                        Intent i = new Intent(getApplicationContext(), RegisterEmployee.class);
                        startActivity(i);
                    } else {
                        Toast.makeText(getApplicationContext(), "Not Valid User!!", Toast.LENGTH_LONG).show();

                    }
                },
                error -> Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show()) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("email", email);
                params.put("pass", password);
                return params;
            }
        };
        requestQueue.add(stringRequest);
    }
}