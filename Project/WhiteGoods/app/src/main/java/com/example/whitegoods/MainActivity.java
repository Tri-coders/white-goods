package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.whitegoods.fcmservice.FcmTokenReceiver;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    Button login;
    EditText email, password;
    ProgressBar progressBar;
    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
    String server_url;

    int UROLE = -1, USER_ID;

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";
    private static final String KEY_EMAIL = "email";
    private static final String KEY_PASSWORD = "password";
    private static final String KEY_ROLE = "role";
    private static final String KEY_FLAG = "flag";
    private static final String KEY_ID = "user_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        server_url = getString(R.string.host_url) + "/login";

        Log.i("host", getString(R.string.host_url));

        email = findViewById(R.id.view_email_login);
        password = findViewById(R.id.view_password_login);
        login = findViewById(R.id.login);
        progressBar=findViewById(R.id.progressBar_login_page);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                loginUser();
            }
        });

        sharedPreferences = getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);
        //When open activity first check shared preferences data available or not

        String email = sharedPreferences.getString(KEY_EMAIL, null);

        if(email != null) {
            String urole = sharedPreferences.getString(KEY_ROLE, null);

            if(urole.equals("0")) {
                Intent viewEmployeeList = new Intent(MainActivity.this, ViewEmployeeList.class);
                startActivity(viewEmployeeList);
            }
            else {
                Intent employeeNav = new Intent(MainActivity.this, EmployeeNav.class);
                employeeNav.putExtra("role", urole);
                startActivity(employeeNav);
            }
        }
    }

    public void loginUser() {
//        Intent i = new Intent(this, RegisterEmployee.class);
//        startActivity(i);
        Log.i("sankey", "login clicked");
//        login.setVisibility(View.GONE);

        String email = this.email.getText().toString();
        String password = this.password.getText().toString();
        login.setEnabled(false);
        progressBar.setVisibility(View.VISIBLE);

        if(email.length()>0 && email.matches(emailPattern)){
            if(password.length()>0){
                func(email, password);
            }else {
                Toast.makeText(MainActivity.this, "Enter the password!!", Toast.LENGTH_SHORT).show();
                login.setEnabled(true);
                progressBar.setVisibility(View.INVISIBLE);
                //return;
            }
        }else{
            Toast.makeText(MainActivity.this, "Inavlid Email ID!!", Toast.LENGTH_SHORT).show();
            login.setEnabled(true);
            progressBar.setVisibility(View.INVISIBLE);
            //return;
        }


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
                login.setEnabled(true);
                progressBar.setVisibility(View.INVISIBLE);
                try {
                    JSONObject jsonObject1 = new JSONObject(response);
                    // Log.i("tracking uid","main Activity "+UID);

                    UROLE = jsonObject1.getInt("role");
                    USER_ID = jsonObject1.getInt("user_id");

                    //writing data into shared preferences
                    SharedPreferences.Editor editor = sharedPreferences.edit();
                    editor.putString(KEY_EMAIL, email);
                    editor.putString(KEY_PASSWORD, password);
                    editor.putString(KEY_ROLE, Integer.toString(UROLE));
                    editor.putString(KEY_ID, Integer.toString(USER_ID));
                    editor.putString(KEY_FLAG, "0");
                    editor.apply();

                    Intent intent = new Intent(MainActivity.this, FcmTokenReceiver.class);
                    startService(intent);

                    if(UROLE == 0) {
                        Intent viewEmployeeList = new Intent(MainActivity.this, ViewEmployeeList.class);
                        startActivity(viewEmployeeList);
                    }
                    else {
                        Intent employeeNav = new Intent(MainActivity.this, EmployeeNav.class);
                        employeeNav.putExtra("role", Integer.toString(UROLE));
                        startActivity(employeeNav);
                    }
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
                Toast.makeText(MainActivity.this, "Logged IN", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                login.setEnabled(true);
                progressBar.setVisibility(View.INVISIBLE);
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

}