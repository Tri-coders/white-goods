package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.service.autofill.TextValueSanitizer;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
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
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import me.bendik.simplerangeview.SimpleRangeView;

public class InventoryDetail extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private InventoryAdapter mAdapter;
    private ArrayList<InventoryCards> mInventoryList;
    private RequestQueue requestQueue;

    ImageButton filterButton, backButton;
    ImageView cover;
    SimpleRangeView rangeBar;
    TextView priceRange,coverText;

    String server_url, wh_good_category;
    String lower_price;
    String higher_price;
    String is_available;
    String brands;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inventory_detail);

        server_url = getString(R.string.host_url) + "/inventory";

        Intent intent = getIntent();
        wh_good_category = intent.getStringExtra("wh_good_category");

        mRecyclerView = findViewById(R.id.recyclerview);
        cover = findViewById(R.id.cover);
        coverText = findViewById(R.id.coverText);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(this));

        mInventoryList = new ArrayList<>();

        requestQueue = Volley.newRequestQueue(this);

        coverImageText();
        filter();
        backButton();

        lower_price = "0";
        higher_price = "9999999999";
        is_available = "0";
        brands = "1, 2, 3, 4";
        parseJSON();

    }

    private void parseJSON() {
        mInventoryList = new ArrayList<>();

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("wh_good_category", wh_good_category);
            jsonObject.put("lower_price", lower_price);
            jsonObject.put("higher_price", higher_price);
            jsonObject.put("q_avail", is_available);
            jsonObject.put("brand", brands);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);

                try {
                    JSONObject invent = new JSONObject(response);
                    JSONArray modelArray = invent.getJSONArray("model");
                    JSONArray partsArray = invent.getJSONArray("parts");

                    for (int i = 0; i < modelArray.length(); i++) {
                        JSONObject model = modelArray.getJSONObject(i);

                        String prodName = model.getString("model_no");
                        String prodImageUrl = model.getString("model_img");
                        String prodPrice = model.getString("model_price");
                        String prodQuantity = model.getString("quantity");

                        mInventoryList.add(new InventoryCards(prodImageUrl, prodName, prodPrice, prodQuantity));
                    }

                    for (int i = 0; i < partsArray.length(); i++) {
                        JSONObject parts = partsArray.getJSONObject(i);

                        String prodName = parts.getString("part_no");
                        String prodImageUrl = parts.getString("part_img");
                        String prodPrice = parts.getString("part_price");
                        String prodQuantity = parts.getString("quantity");

                        mInventoryList.add(new InventoryCards(prodImageUrl, prodName, prodPrice, prodQuantity));
                    }

                    mAdapter = new InventoryAdapter(InventoryDetail.this, mInventoryList);
                    mRecyclerView.setAdapter(mAdapter);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(InventoryDetail.this, "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                } catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(InventoryDetail.this, "Check Network", Toast.LENGTH_SHORT).show();
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

    private void filter() {
        filterButton = findViewById(R.id.filter);

        Toast.makeText(InventoryDetail.this, "Filter Is working", Toast.LENGTH_SHORT).show();

        filterButton.setOnClickListener((View v) -> {
            BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(InventoryDetail.this, R.style.BottomSheetDialogTheme);

            View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(R.layout.layout_bottom_sheet, (LinearLayout) findViewById(R.id.bottomSheetContainer));

            onClosingBottomSheetDialog(bottomSheetDialog, bottomSheetView);

            rangeBar = bottomSheetView.findViewById(R.id.range_bar);
            priceRange = bottomSheetView.findViewById(R.id.price_range);

            //rangeBar Code
            rangeBar();

            bottomSheetDialog.setContentView(bottomSheetView);
            bottomSheetDialog.show();
        });
    }

    private void onClosingBottomSheetDialog(BottomSheetDialog bottomSheetDialog, View bottomSheetView) {
        bottomSheetDialog.setOnCancelListener(dialogInterface -> {
            //first get all elements by id
            CheckBox samsung = bottomSheetView.findViewById(R.id.samsung);
            CheckBox godrej = bottomSheetView.findViewById(R.id.godrej);
            CheckBox lg = bottomSheetView.findViewById(R.id.lg);
            CheckBox whirlpool = bottomSheetView.findViewById(R.id.whirlpool);

            RadioGroup radioGroup = bottomSheetView.findViewById(R.id.radio_group);
            RadioButton low_to_high = bottomSheetView.findViewById(R.id.radio_lh);
            RadioButton high_to_low = bottomSheetView.findViewById(R.id.radio_hl);
            RadioButton inStock = bottomSheetView.findViewById(R.id.inStock);

            //check for range given by user
            String range = String.valueOf(priceRange.getText());
            String[] r = new String[2];
            r = range.split("-");
            lower_price = r[0] + "000"; // adding 3 zeros... to making it in thousands
            higher_price = r[1] + "0000"; //adding 4 zeroes... to making it in ten thousands

            //check if in stock is selected
            if (radioGroup.getCheckedRadioButtonId() != -1) {
                if (inStock.isSelected()) {
                    is_available = "1";
                } else {
                    is_available = "0";
                }
            }

            //check for brands checkboxes... check which are checked
            brands = "";
            if (samsung.isChecked()) {
                brands += "1";
            }
            if (lg.isChecked()) {
                if (brands.equals("")) {
                    brands += "2";
                } else {
                    brands += ", 2";
                }
            }
            if (godrej.isChecked()) {
                if (brands.equals("")) {
                    brands += "3";
                } else {
                    brands += ", 3";
                }
            }
            if (whirlpool.isChecked()) {
                if (brands.equals("")) {
                    brands += "4";
                } else {
                    brands += ", 4";
                }
            }
            if (brands.equals("")) {
                brands = "1, 2, 3, 4";
            }

            //logging all values for debugging and testing
            Log.i("sanky", lower_price);
            Log.i("sanky", higher_price);
            Log.i("sanky", is_available);
            Log.i("sanky", brands);

            //Toast.makeText(this, lower_price + " " + higher_price + " " + is_available + " " + brands, Toast.LENGTH_SHORT).show();
            parseJSON();
        });
    }

    private void rangeBar() {
        rangeBar.setOnChangeRangeListener(new SimpleRangeView.OnChangeRangeListener() {
            @Override
            public void onRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i, int i1) {
                priceRange.setText(String.valueOf(i) + "-" + String.valueOf(i1));
            }
        });

        rangeBar.setOnTrackRangeListener(new SimpleRangeView.OnTrackRangeListener() {
            @Override
            public void onStartRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i) {
                priceRange.setText(String.valueOf(i));

            }

            @Override
            public void onEndRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i) {
                priceRange.setText(String.valueOf(i));
            }
        });

        rangeBar.setOnRangeLabelsListener(new SimpleRangeView.OnRangeLabelsListener() {
            @Nullable
            @Override
            public String getLabelTextForPosition(@NotNull SimpleRangeView simpleRangeView, int i, @NotNull SimpleRangeView.State state) {
                return String.valueOf(i);
            }
        });
    }

    private void coverImageText() {
        switch (wh_good_category) {
            case "1":
                cover.setBackgroundResource(R.drawable.ac2);
                coverText.setText(R.string.AC);
                break;
            case "2":
                cover.setBackgroundResource(R.drawable.fridge2);
                coverText.setText(R.string.fridge);
                break;
            case "3":
                cover.setBackgroundResource(R.drawable.oven2);
                coverText.setText(R.string.oven);
                break;
            case "4":
                cover.setBackgroundResource(R.drawable.wm2);
                coverText.setText(R.string.wm);
                break;
        }
    }

    private void backButton() {
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }

}