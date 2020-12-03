package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.widget.EditText;
import android.widget.ImageButton;
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
import java.util.ArrayList;

public class SelectEmployee extends AppCompatActivity implements ViewEmpListRecylerAdapter.OnItemClickListener{

    private RecyclerView mRecyclerView;
    private ViewEmpListRecylerAdapter mAdapter;
    private ArrayList<ViewEmpListRecylerCards> mExampleList;
    private RequestQueue requestQueue;
    ImageButton backButton;


    String server_url;

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";

    String userId, userName, title, desc, custName, custAddress, custCity, custPin, custEmail, time, date, custphone;
    int serviceCharge, itemCost;
    String discount, is_discount, totalCost;
    private EditText searchInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_employee);

        server_url = getString(R.string.host_url) + "/get_employee";
        is_discount = "1";

        getIntentData();
        backButton();

        //search code
        searchInput = findViewById(R.id.searchBar);

        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                mAdapter.getFilter().filter(charSequence);
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        mRecyclerView = findViewById(R.id.employeeRecyclerView);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        mExampleList = new ArrayList<>();

        requestQueue = Volley.newRequestQueue(this);
        parseJSON();
    }

    private void getIntentData() {
        Intent intent = getIntent();

        userId = intent.getStringExtra("user_id");
        title = intent.getStringExtra("title");
        desc = intent.getStringExtra("description");
        custName = intent.getStringExtra("name");
        custAddress = intent.getStringExtra("address");
        custCity = intent.getStringExtra("city");
        custPin  = intent.getStringExtra("pincode");
        custEmail = intent.getStringExtra("email");
        time = intent.getStringExtra("time");
        date = intent.getStringExtra("date");
        custphone = intent.getStringExtra("phone");
        serviceCharge = intent.getIntExtra("serviceCharge", 0);
        itemCost = intent.getIntExtra("itemCost", 0);
        discount = intent.getStringExtra("discount");
        totalCost = intent.getStringExtra("totalCost");

    }

    private void parseJSON() {

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("data", "some");
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
                    JSONArray jsonArray = new JSONArray(response);

                    for(int i=0; i< jsonArray.length(); i++) {
                        JSONObject minutes = jsonArray.getJSONObject(i);

                        String userId = minutes.getString("user_id");
                        String name = minutes.getString("name");
                        String address = minutes.getString("address");
                        String city = minutes.getString("city");
                        String pin = minutes.getString("pin");
                        String contact = minutes.getString("contact");
                        String email = minutes.getString("email");
                        String roleTop = minutes.getString("role");
                        String image = minutes.getString("image");

                        String install = minutes.getString("install");
                        String inventory = minutes.getString("inventory");
                        String demo = minutes.getString("demo");
                        String upgrade = minutes.getString("upgrade");

                        String role = "";
                        if(roleTop.equals("1")) {
                            role = "Manager";
                        } else {
                            if(install.equals("1")) {
                                role += "Install";
                            }
                            if(inventory.equals("1")) {
                                if(!role.equals("")) {
                                    role += " ";
                                }
                                role += "Inventory";
                            }
                            if(demo.equals("1")) {
                                if(!role.equals("")) {
                                    role += " ";
                                }
                                role += "Demo";
                            }
                            if(upgrade.equals("1")) {
                                if(!role.equals("")) {
                                    role += " ";
                                }
                                role += "Upgrade";
                            }

                            role = role.replace(" ", ", ");
                        }

                        mExampleList.add(new ViewEmpListRecylerCards(userId, image, name, role, email, contact, address,city, pin));
                    }

                    mAdapter = new ViewEmpListRecylerAdapter(SelectEmployee.this, mExampleList);
//                    mAdapter.notifyDataSetChanged();
                    mRecyclerView.setAdapter(mAdapter);
                    mAdapter.setOnItemClickListener(SelectEmployee.this);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
                Toast.makeText(SelectEmployee.this, "Logged IN", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(SelectEmployee.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(SelectEmployee.this, "Check Network", Toast.LENGTH_SHORT).show();
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

    @Override
    public void onItemClick(int position) {
        Toast.makeText(this, "hurray", Toast.LENGTH_SHORT).show();
        ViewEmpListRecylerCards clickedCard = mExampleList.get(position);

        userId = clickedCard.getUserId();
        userName = clickedCard.getName();

        openDialog();
    }

    private void openDialog() {
        Bundle b = new Bundle();

        b.putString("empId", userId);
        b.putString("empName", userName);
        b.putString("title", title);
        b.putString("description", desc);
        b.putString("name", custName);
        b.putString("address", custAddress);
        b.putString("city", custCity);
        b.putString("pincode", custPin);
        b.putString("email", custEmail);
        b.putString("time", time);
        b.putString("date", date);
        b.putString("phone", custphone);
        b.putString("serviceCharge", Integer.toString(serviceCharge));
        b.putString("itemCost", Integer.toString(itemCost));
        b.putString("discount", discount);
        b.putString("isDiscount", is_discount);
        b.putString("totalCost",totalCost);

        RequestPreviewDialog d = new RequestPreviewDialog();
        d.setArguments(b);
        d.show(getSupportFragmentManager(), "My preview");
    }

    private void backButton() {
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }

}