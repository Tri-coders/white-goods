package com.example.whitegoods;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

public class RequestFragment extends Fragment implements View.OnClickListener {
    View root;
    Button newButton, resButton, susButton, canButton;

    String server_url;

    private RecyclerView mRecyclerView;
    private RequestAdapter mRequestAdapter;
    private ArrayList<RequestCard> mRequestList;
    private RequestQueue mRequestQueue;

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_request, container, false);
        newButton = root.findViewById(R.id.newButton);
        resButton = root.findViewById(R.id.resButton);
        susButton = root.findViewById(R.id.susButton);
        canButton = root.findViewById(R.id.canButton);

        server_url = getString(R.string.host_url) + "/allrequests";

        mRecyclerView = root.findViewById(R.id.requestsRecyclerView);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        mRequestList = new ArrayList<>();

        mRequestQueue = Volley.newRequestQueue(getContext());
        parseJSON();

        setClickListener();

        floatingActionButtonCall();

        return root;
    }

    private void parseJSON() {

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("role", 1);
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
                try {
                    JSONArray jsonArray = new JSONArray(response);

                    for(int i=0; i< jsonArray.length(); i++) {
                        JSONObject requests = jsonArray.getJSONObject(i);

                        String RequestId = requests.getString("request_id");
                        String RequestTitle = requests.getString("title");
                        String EmpName = requests.getString("name");
                        String date = requests.getString("date");
                        String time = requests.getString("time");
                        String location = requests.getString("city");

                        mRequestList.add(new RequestCard(RequestId, RequestTitle, EmpName, date, time, location));
                    }

                    mRequestAdapter = new RequestAdapter(getActivity(), mRequestList);
//                    mAdapter.notifyDataSetChanged();
                    mRecyclerView.setAdapter(mRequestAdapter);
//                    mAdapter.setOnItemClickListener(ViewEmployeeList.this);
                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
                Toast.makeText(getActivity(), "Logged IN", Toast.LENGTH_SHORT).show();
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
        //sending JSONObject String to server ends

        mRequestQueue.add(stringRequest); // get response from server

    }

    private void floatingActionButtonCall() {

        FloatingActionButton newReq = root.findViewById(R.id.add_req);
        newReq.setOnClickListener(view -> {
            Intent i = new Intent(getActivity(), CreateRequest.class);
            startActivity(i);
        });

    }

    public void setClickListener() {
        newButton.setOnClickListener(this);
        resButton.setOnClickListener(this);
        susButton.setOnClickListener(this);
        canButton.setOnClickListener(this);
    }


    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.newButton:
                newButton.setBackgroundResource(R.color.main);
                newButton.setTextColor(Color.parseColor("#ffffff"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

            case R.id.resButton:
                resButton.setBackgroundResource(R.color.main);
                resButton.setTextColor(Color.parseColor("#ffffff"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

                case R.id.susButton:
                susButton.setBackgroundResource(R.color.main);
                susButton.setTextColor(Color.parseColor("#ffffff"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

                case R.id.canButton:
                canButton.setBackgroundResource(R.color.main);
                canButton.setTextColor(Color.parseColor("#ffffff"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;
        }

    }

}
