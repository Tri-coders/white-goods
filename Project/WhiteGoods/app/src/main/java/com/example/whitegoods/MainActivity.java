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
    private EditText email,password;
    private static String URL_LOGIN = "http://128.199.30.114:9000/login";
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
        login.setVisibility(View.GONE);

        final String email = this.email.getText().toString();
        final String password = this.password.getText().toString();

        func(email,password);
        login.setVisibility(View.VISIBLE);
    }
    private void func(String email,String password)
    {
        RequestQueue requestQueue= Volley.newRequestQueue(getApplicationContext());

        StringRequest stringRequest=new StringRequest(Request.Method.POST, URL_LOGIN,
                response -> {

                    //Toast.makeText(getApplicationContext(),response,Toast.LENGTH_LONG).show();
                    if(response.equals("ok")) {
                        Intent i = new Intent(getApplicationContext(), RegisterEmployee.class);
                        startActivity(i);
                    }else{
                        Toast.makeText(getApplicationContext(),"Not Valid User!!",Toast.LENGTH_LONG).show();

                    }
                },
                error -> Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show()){
            @Override
            protected  Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("email",email);
                params.put("pass",password);
                return params;
            }
        };
        requestQueue.add(stringRequest);
    }
}