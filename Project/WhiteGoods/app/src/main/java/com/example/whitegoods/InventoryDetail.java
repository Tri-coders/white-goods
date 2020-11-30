package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.DialogFragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.bottomsheet.BottomSheetDialog;

import org.florescu.android.rangeseekbar.RangeSeekBar;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public class InventoryDetail extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private ArrayList<InventoryCards> mInventoryList;
    private RequestQueue mRequestQueue;

    ImageButton filterButton;

    String wh_good_category;
    String lower_price = "0";
    String higher_price = "9999999999";
    String is_available = "0";
    String brands = "";

    boolean is_samsung = false;
    boolean is_godrej = false;
    boolean is_lg = false;
    boolean is_whirlpool = false;

    String server_url;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inventory_detail);

        server_url = getString(R.string.host_url) + "/inventory";

        Intent intent = getIntent();
        wh_good_category = intent.getStringExtra("wh_good_category");

        mRecyclerView = findViewById(R.id.recyclerview);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        mInventoryList = new ArrayList<>();

        mRequestQueue = Volley.newRequestQueue(this);
//        parseJSON();

        filter();

    }

//    private void parseJSON() {
//
//        final JSONObject jsonObject = new JSONObject();
//        try {
//            jsonObject.put("wh_good_category", wh_good_category);
//            jsonObject.put("lower_price", lower_price);
//            jsonObject.put("higher_price", higher_price);
//            jsonObject.put("q_avail", is_available);
//            jsonObject.put("brand", brands);
//        }
//        catch (JSONException e) {
//            e.printStackTrace();
//        }
//
//        final String requestBody = jsonObject.toString();
//        Log.i("VolleyABC", requestBody);
//
//        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url, new Response.Listener<String>() {
//            @Override
//            public void onResponse(String response) {
//                Log.i("VolleyABC", "got response " + response);
//                try {
//                    JSONArray jsonArray = new JSONArray(response);
//
//                    for(int i=0; i< jsonArray.length(); i++) {
//                        JSONObject minutes = jsonArray.getJSONObject(i);
//
//                        String userId = minutes.getString("user_id");
//                        String name = minutes.getString("name");
//                        String address = minutes.getString("address");
//                        String city = minutes.getString("city");
//                        String pin = minutes.getString("pin");
//                        String contact = minutes.getString("contact");
//                        String email = minutes.getString("email");
//                        String roleTop = minutes.getString("role");
//                        String image = minutes.getString("image");
//
//                        String install = minutes.getString("install");
//                        String inventory = minutes.getString("inventory");
//                        String demo = minutes.getString("demo");
//                        String upgrade = minutes.getString("upgrade");
//
//                        String role = "";
//                        if(roleTop.equals("1")) {
//                            role = "Manager";
//                        } else {
//                            if(install.equals("1")) {
//                                role += "Install";
//                            }
//                            if(inventory.equals("1")) {
//                                if(!role.equals("")) {
//                                    role += " ";
//                                }
//                                role += "Inventory";
//                            }
//                            if(demo.equals("1")) {
//                                if(!role.equals("")) {
//                                    role += " ";
//                                }
//                                role += "Demo";
//                            }
//                            if(upgrade.equals("1")) {
//                                if(!role.equals("")) {
//                                    role += " ";
//                                }
//                                role += "Upgrade";
//                            }
//
//                            role = role.replace(" ", ", ");
//                        }
//
//                        mExampleList.add(new ViewEmpListRecylerCards(userId, image, name, role, email, contact, address,city, pin));
//                    }
//
//                    mAdapter = new ViewEmpListRecylerAdapter(ViewEmployeeList.this, mExampleList);
////                    mAdapter.notifyDataSetChanged();
//                    mRecyclerView.setAdapter(mAdapter);
//                    mAdapter.setOnItemClickListener(ViewEmployeeList.this);
//                }
//                catch (JSONException e) {
//                    e.printStackTrace();
//                }
//                Toast.makeText(ViewEmployeeList.this, "Logged IN", Toast.LENGTH_SHORT).show();
//            }
//        }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                try {
//                    Log.i("VolleyABC", error.toString());
//                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
//                    Toast.makeText(ViewEmployeeList.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();
//
//                    error.printStackTrace();
//                }
//                catch (Exception e) {
//                    Log.i("VolleyABC", e.toString());
//                    Toast.makeText(ViewEmployeeList.this, "Check Network", Toast.LENGTH_SHORT).show();
//                }
//            }
//        }) {
//            //sending JSONObject String to server starts
//            @Override
//            public byte[] getBody() throws AuthFailureError {
//                try {
//                    return requestBody.getBytes("utf-8");
//                } catch (UnsupportedEncodingException e) {
//                    e.printStackTrace();
//                    return null;
//                }
//            }
//
//            @Override
//            public String getBodyContentType() {
//                return "application/json; charset=utf-8";
//            }
//        };
//        //sending JSONObject String to server ends
//
//        .add(stringRequest); // get response from server
//
//    }

    private void filter() {
        filterButton = findViewById(R.id.filter);

        Toast.makeText(InventoryDetail.this, "Filter Is working", Toast.LENGTH_SHORT).show();

        filterButton.setOnClickListener((View v) -> {
            BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(InventoryDetail.this, R.style.BottomSheetDialogTheme);

            View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(R.layout.layout_bottom_sheet, (LinearLayout) findViewById(R.id.bottomSheetContainer));

            CheckBox samsung = findViewById(R.id.samsung);
            CheckBox godrej = findViewById(R.id.godrej);
            CheckBox lg = findViewById(R.id.lg);
            CheckBox whirlpool = findViewById(R.id.whirlpool);

            samsung.setOnClickListener(view -> {
                is_samsung = !is_samsung;
            });
            godrej.setOnClickListener(view -> {
                is_godrej = !is_godrej;
            });
            lg.setOnClickListener(view -> {
                is_lg = !is_lg;
            });
            whirlpool.setOnClickListener(view -> {
                is_whirlpool = !is_whirlpool;
            });

            bottomSheetDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
                @Override
                public void onCancel(DialogInterface dialogInterface) {

                }
            });


            bottomSheetDialog.setContentView(bottomSheetView);
            bottomSheetDialog.show();
        });
    }

}