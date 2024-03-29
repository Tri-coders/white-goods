package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
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
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public class ViewEmployeeList extends AppCompatActivity implements ViewEmpListRecylerAdapter.OnItemClickListener {

    private RecyclerView mRecyclerView;
    private ViewEmpListRecylerAdapter mAdapter;
    private ArrayList<ViewEmpListRecylerCards> mExampleList;
    private RequestQueue requestQueue;
    private EditText searchInput;

    String server_url;

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_employee_list);

        LogOut();

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

        server_url = getString(R.string.host_url) + "/get_employee";

        FloatingActionButton newEmployee = findViewById(R.id.add_button);
        newEmployee.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent registerEmployee = new Intent(ViewEmployeeList.this, RegisterEmployee.class);
                startActivity(registerEmployee);
            }
        });

        mRecyclerView = findViewById(R.id.employeeRecyclerView);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        mExampleList = new ArrayList<>();

        requestQueue = Volley.newRequestQueue(this);
        parseJSON();
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

                    mAdapter = new ViewEmpListRecylerAdapter(ViewEmployeeList.this, mExampleList);
//                    mAdapter.notifyDataSetChanged();
                    mRecyclerView.setAdapter(mAdapter);
                    mAdapter.setOnItemClickListener(ViewEmployeeList.this);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
                Toast.makeText(ViewEmployeeList.this, "Logged IN", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(ViewEmployeeList.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(ViewEmployeeList.this, "Check Network", Toast.LENGTH_SHORT).show();
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
        Intent detailView = new Intent(this, EditProfile.class);
        ViewEmpListRecylerCards clickedCard = mExampleList.get(position);

        detailView.putExtra("userId", clickedCard.getUserId());
        detailView.putExtra("imageUrl", clickedCard.getImageResource());
        detailView.putExtra("empName", clickedCard.getName());
        detailView.putExtra("empRole", clickedCard.getRole());
        detailView.putExtra("email", clickedCard.getEmail());
        detailView.putExtra("phone", clickedCard.getPhone());
        detailView.putExtra("address", clickedCard.getAddress());
        detailView.putExtra("city", clickedCard.getCity());
        detailView.putExtra("pinCode", clickedCard.getPin());
        detailView.putExtra("is_admin", "1");

        startActivity(detailView);
    }

    private void LogOut() {
        ImageButton logOut = findViewById(R.id.log_out);

        logOut.setOnClickListener(view -> {
            sharedPreferences = getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);

            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.clear();
            editor.apply();
            finish();
        });
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        finishAffinity();
    }
}