package com.example.whitegoods;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;

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

import static android.content.Context.MODE_PRIVATE;

public class RequestPreviewDialog extends AppCompatDialogFragment {

    private static final String SHARED_PREF_NAME = "mypref";
    private static final String KEY_FLAG = "flag";
    SharedPreferences sharedPreferences;

    TextView mEmpName, mTitle, mDesc, mCustName, mCustAddress, mCustCity, mCustPin, mCustEmail, mTime, mDate, mCustphone;
    TextView mServiceCharge, mItemCost, mDiscount, mTotalCost;

    String server_url, user_id;
    String title, desc, empName, custName, custAddress, custPin, custCity, custEmail;
    String custPhone, date, time, service, itemCost, discount, totalCost, isDiscount;

    private RequestQueue requestQueue;

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

        sharedPreferences = getActivity().getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);

        LayoutInflater inflater = getActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.layout_dialog_request_preview, null);

        server_url = getString(R.string.host_url) + "/request";
        requestQueue = Volley.newRequestQueue(getContext());

        setElements(view);

        builder.setView(view)
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {

                    }
                })
                .setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        parseJSON();
                        Toast.makeText(getActivity(), "success", Toast.LENGTH_SHORT).show();
                        SharedPreferences.Editor editor = sharedPreferences.edit();
                        editor.putString(KEY_FLAG, "1");
                        editor.apply();
                        getActivity().finish();
                    }
                });

        return builder.create();
    }

    private void setElements(View view) {

        mEmpName = view.findViewById(R.id.emp_name);
        mTitle = view.findViewById(R.id.request_title);
        mDesc = view.findViewById(R.id.request_description);
        mCustName = view.findViewById(R.id.request_cust_name);
        mCustAddress = view.findViewById(R.id.request_cust_address);
        mCustCity = view.findViewById(R.id.request_cust_city);
        mCustPin = view.findViewById(R.id.request_cust_pin);
        mCustEmail = view.findViewById(R.id.request_cust_email);
        mTime = view.findViewById(R.id.request_time);
        mDate = view.findViewById(R.id.request_date);
        mCustphone = view.findViewById(R.id.request_cust_phone);
        mServiceCharge = view.findViewById(R.id.request_service);
        mItemCost = view.findViewById(R.id.item_cost);
        mDiscount = view.findViewById(R.id.discount);
        mTotalCost = view.findViewById(R.id.total_cost);

        user_id = this.getArguments().getString("empId");
        title = this.getArguments().getString("title");
        desc = this.getArguments().getString("description");
        custName = this.getArguments().getString("name");
        custAddress = this.getArguments().getString("address");
        custCity = this.getArguments().getString("city");
        custEmail = this.getArguments().getString("email");
        custPhone = this.getArguments().getString("phone");
        custPin = this.getArguments().getString("pincode");
        time = this.getArguments().getString("time");
        date = this.getArguments().getString("date");
        service = this.getArguments().getString("serviceCharge");
        itemCost = this.getArguments().getString("itemCost");
        discount = this.getArguments().getString("discount");
        isDiscount = this.getArguments().getString("isDiscount");
        totalCost = this.getArguments().getString("totalCost");
        empName = this.getArguments().getString("empName");

        Log.i("sanky_user_id", user_id);

        mTitle.setText("Title: " + title);
        mDesc.setText("Description: " + desc);
        mCustName.setText("Name: " + custName);
        mCustphone.setText("Phone: " + custPhone);
        mCustEmail.setText("Email: " + custEmail);
        mCustAddress.setText("Address: " + custAddress);
        mCustCity.setText("City: " + custCity);
        mCustPin.setText("Pincode: " + custPin);
        mTime.setText(time);
        mDate.setText(date);
        mServiceCharge.setText("Service Charge: " + service);
        mItemCost.setText("Item Cost: " + itemCost);
        mDiscount.setText("Discount: " + discount);
        mTotalCost.setText("Total Cost: " + totalCost);
        mEmpName.setText(empName);
    }

    private void parseJSON() {

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user_id", user_id);
            jsonObject.put("title", title);
            jsonObject.put("description", desc);
            jsonObject.put("name", custName);
            jsonObject.put("address", custAddress);
            jsonObject.put("city", custCity);
            jsonObject.put("pin", custPin);
            jsonObject.put("contact", custPhone);
            jsonObject.put("email", custEmail);
            jsonObject.put("date", date);
            jsonObject.put("time", time);
            jsonObject.put("service", service);
            jsonObject.put("itemCost", itemCost);
            jsonObject.put("isDiscount", isDiscount);
            jsonObject.put("discount", discount);
            jsonObject.put("totalCost", totalCost);
            jsonObject.put("status", "00");
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

//                Toast.makeText(getActivity(), "Request Created Successfully", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(getActivity(), "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(getActivity(), "Check Network", Toast.LENGTH_SHORT).show();
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

        requestQueue.add(stringRequest);

    }
}
