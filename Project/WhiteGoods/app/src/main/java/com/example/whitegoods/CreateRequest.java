package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
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
import java.util.Calendar;
import android.widget.ImageButton;

public class CreateRequest extends AppCompatActivity {
    ImageButton backButton;
    EditText title,reqDescription,name,addr,city,pincode,phone,email,time,serviceCharge,cost,discount;
    TextView dateText,totalCost;
    Button register,date;
    ProgressBar progressBar;
    private static final String SHARED_PREF_NAME = "mypref";

    private int mDate,mMonth,mYear;

    SharedPreferences sharedPreferences;

    private static final String KEY_ID = "user_id";

    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
    String user_id;
    String server_url = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        server_url = this.getResources().getString(R.string.host_url) + "/request";
        setContentView(R.layout.activity_create_request);
        backButton();

        title = findViewById(R.id.title);
        reqDescription = findViewById(R.id.description);
        name = findViewById(R.id.cName);
        addr = findViewById(R.id.cAddr);
        city = findViewById(R.id.city);
        pincode = findViewById(R.id.pincode);
        phone = findViewById(R.id.cphone);
        email=findViewById(R.id.email);
        time = findViewById(R.id.tiime);
        serviceCharge = findViewById(R.id.serviceCharge);
        cost = findViewById(R.id.itemCost);
        discount = findViewById(R.id.discountpercent);
        dateText = findViewById(R.id.dateText);
        totalCost = findViewById(R.id.totalCost);

        sharedPreferences = getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);
        user_id = sharedPreferences.getString(KEY_ID, null);

        date = findViewById(R.id.date);
        register = findViewById(R.id.register_emp);

        progressBar = findViewById(R.id.progressBar_register_page);

        date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final Calendar calendar = Calendar.getInstance();
                mDate = calendar.get(Calendar.DATE);
                mMonth = calendar.get(Calendar.MONTH);
                mYear = calendar.get(Calendar.YEAR);
                DatePickerDialog datePickerDialog = new DatePickerDialog(CreateRequest.this, android.R.style.Theme_DeviceDefault_Dialog, new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker datePicker, int year, int month, int date) {
                        dateText.setText(date+"-"+month+"-"+year);
                    }
                },mYear,mMonth,mDate);
                datePickerDialog.show();
            }
        });

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                registerRequest();
            }
        });


    }

    /*serviceCharge = findViewById(R.id.serviceCharge);
        cost = findViewById(R.id.itemCost);
        discount = findViewById(R.id.discountpercent); */

    public void registerRequest(){
        progressBar.setVisibility(View.VISIBLE);

        String user_id = this.user_id;
        String titleTxt= String.valueOf(this.title.getText());
        String description = String.valueOf(this.reqDescription.getText());
        String name = String.valueOf(this.name.getText());
        String addr = String.valueOf(this.addr.getText());
        String city = String.valueOf(this.city.getText());
        String pincode = String.valueOf(this.pincode.getText());
        String phone = String.valueOf(this.phone.getText());
        String email = String.valueOf(this.email.getText());
        String time = String.valueOf(this.time.getText());
        if(TextUtils.isEmpty(this.serviceCharge.getText())){
            Toast.makeText(CreateRequest.this,"Service Charge Empty",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            return;
        }
        int serviceCharge = Integer.parseInt(String.valueOf((this.serviceCharge.getText())));

        if(TextUtils.isEmpty(this.cost.getText())){
            Toast.makeText(CreateRequest.this,"Cost Field Empty",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            return;
        }
        int itemCost = Integer.parseInt(String.valueOf(this.cost.getText()));

        if(TextUtils.isEmpty(this.discount.getText())){
            Toast.makeText(CreateRequest.this,"Discount Field Empty",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            return;
        }
        double discount = Double.parseDouble(String.valueOf(this.discount.getText()));

        String dateText = String.valueOf(this.dateText.getText());
        String totalCost = "Rs. "+ ((itemCost + serviceCharge) - ((itemCost + serviceCharge) * discount / 100));
        Log.d("Totalcost", "TotalCost : "+totalCost);


        if(titleTxt.length()>0){
            if(description.length()>0){
                if(name.length()>0){
                    if(addr.length()>0){
                        if(city.length()>0){
                            if(pincode.length()==6){
                                if(email.length()>0 && email.matches(emailPattern)){
                                    String[] a = time.split(":",2);
                                    if(a.length!=2){
                                        Toast.makeText(CreateRequest.this,"Time Not Valid",Toast.LENGTH_SHORT).show();
                                        progressBar.setVisibility(View.INVISIBLE);
                                        return;
                                    }
                                    int hr = Integer.parseInt(a[0]);
                                    int min = Integer.parseInt(a[1]);
                                    if(hr>=0 && hr<=23 && min>=0 && min<=59){
                                        if(dateText.length()>0){
                                            if(phone.length()==10){
                                                fun(user_id,titleTxt,description,name,addr,city,pincode,email,time,dateText,phone,serviceCharge,itemCost,discount,totalCost);
                                            }else{
                                                Toast.makeText(CreateRequest.this,"Invalid Contact",Toast.LENGTH_SHORT).show();
                                                progressBar.setVisibility(View.INVISIBLE);
                                                return;
                                            }
                                        }else{
                                            Toast.makeText(CreateRequest.this,"Invalid Date",Toast.LENGTH_SHORT).show();
                                            progressBar.setVisibility(View.INVISIBLE);
                                            return;
                                        }
                                    }else{
                                        Toast.makeText(CreateRequest.this,"Invalid Time",Toast.LENGTH_SHORT).show();
                                        progressBar.setVisibility(View.INVISIBLE);
                                        return;
                                    }
                                }else{
                                    Toast.makeText(CreateRequest.this,"Invalid Email",Toast.LENGTH_SHORT).show();
                                    progressBar.setVisibility(View.INVISIBLE);
                                    return;
                                }
                            }else{
                                Toast.makeText(CreateRequest.this,"Inavid Pincode",Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.INVISIBLE);
                                return;
                            }
                        }else{
                            Toast.makeText(CreateRequest.this,"Invalid City",Toast.LENGTH_SHORT).show();
                            progressBar.setVisibility(View.INVISIBLE);
                            return;
                        }
                    }else{
                        Toast.makeText(CreateRequest.this,"Invalid Address",Toast.LENGTH_SHORT).show();
                        progressBar.setVisibility(View.INVISIBLE);
                        return;
                    }
                }else{
                    Toast.makeText(CreateRequest.this,"Name field is Empty",Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.INVISIBLE);
                    return;
                }
            }else{
                Toast.makeText(CreateRequest.this,"Description Field is Empty",Toast.LENGTH_SHORT).show();
                progressBar.setVisibility(View.INVISIBLE);
                return;
            }
        }else{
            Toast.makeText(CreateRequest.this,"Title field is Empty",Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.INVISIBLE);
            return;
        }
    }

    private void fun(String user_id, String titleTxt, String description, String name, String addr, String city, String pincode, String email, String time, String dateText, String phone, int serviceCharge, int itemCost, double discount, String totalCost) {
        String discount1 = String.valueOf(discount);
        Intent intent = new Intent(getApplicationContext(), SelectEmployee.class);
        intent.putExtra("user_id", user_id);
        intent.putExtra("title", titleTxt);
        intent.putExtra("description", description);
        intent.putExtra("name", name);
        intent.putExtra("address", addr);
        intent.putExtra("city", city);
        intent.putExtra("pincode", pincode);
        intent.putExtra("email", email);
        intent.putExtra("time", time);
        intent.putExtra("date", dateText);
        intent.putExtra("phone", phone);
        intent.putExtra("serviceCharge", serviceCharge);
        intent.putExtra("itemCost", itemCost);
        intent.putExtra("discount", discount1);
        intent.putExtra("totalCost", totalCost);
        startActivity(intent);

    }
    //select_employee


    private void backButton(){
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }

}