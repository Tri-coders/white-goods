package com.example.whitegoods;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.sundeepk.compactcalendarview.CompactCalendarView;
import com.github.sundeepk.compactcalendarview.domain.Event;

import org.florescu.android.rangeseekbar.RangeSeekBar;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import static android.content.Context.MODE_PRIVATE;

public class HomeFragment extends Fragment {
    CompactCalendarView compactCalendar;
    View root;
    SharedPreferences sharedPreferences;

    String server_url_request, user_id, EmpName;

    private RecyclerView mRecyclerView;
    private RequestAdapter mRequestAdapter;
    private ArrayList<RequestCard> mRequestList;
    private RequestQueue mRequestQueue;

    private static final String SHARED_PREF_NAME = "mypref";
    String server_url;
    private SimpleDateFormat dateFormatMonth = new SimpleDateFormat("MMM - yyyy", Locale.getDefault());
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_home, container, false);

        server_url_request = getString(R.string.host_url) + "/allrequests";

        LogOut();

        try {
            calendar();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        mRecyclerView = root.findViewById(R.id.requestsRecyclerView);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        mRequestList = new ArrayList<>();

        mRequestQueue = Volley.newRequestQueue(getContext());
        parseJSON();


        return root;
    }

    private void calendar() throws ParseException {
        server_url = getString(R.string.host_url)+"/schedules";
        final JSONObject jsonObject = new JSONObject();
        try {
            user_id = getActivity().getSharedPreferences("mypref", Context.MODE_PRIVATE).getString("user_id",null);
            jsonObject.put("user_id",user_id);
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        compactCalendar = (CompactCalendarView) root.findViewById(R.id.compactcalendar_view);
        compactCalendar.setUseThreeLetterAbbreviation(true);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);
                try {
                    JSONArray jsonArray = new JSONArray(response);

                    for(int i=0; i< jsonArray.length(); i++) {
                        JSONObject data = jsonArray.getJSONObject(i);

                        String date1 = data.getString("date");
                        String time = data.getString("time");

                        //Setting Event/Schedule

                        String myDate = date1 + " " + time + ":00";
                        @SuppressLint("SimpleDateFormat") SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                        Date date = sdf.parse(myDate);
                        assert date != null;
                        long millis = date.getTime();

                        Event ev1 = new Event(Color.RED, millis,"Microwave Repair");
                        compactCalendar.addEvent(ev1);
                        compactCalendar.setListener(new CompactCalendarView.CompactCalendarViewListener() {
                            @Override
                            public void onDayClick(Date dateClicked) {
                                Context context = getActivity();
                                Toast.makeText(context, dateClicked.toString() , Toast.LENGTH_SHORT).show();

                            }
                            @Override
                            public void onMonthScroll(Date firstDayOfNewMonth) {

                            }
                        });
                    }
                }
                catch (JSONException | ParseException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Toast.makeText(getActivity(), "No Schedule", Toast.LENGTH_SHORT).show();
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

        stringRequest.setRetryPolicy(new DefaultRetryPolicy(6000,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        //sending JSONObject String to server ends
        RequestQueue requestQueue = Volley.newRequestQueue(getActivity());
        requestQueue.add(stringRequest); // get response from server

    }
    private void LogOut() {
        ImageButton logOut = root.findViewById(R.id.log_out);

        logOut.setOnClickListener(view -> {
            sharedPreferences = getActivity().getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);

            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.clear();
            editor.apply();
            getActivity().finish();

        });
    }

    private void parseJSON() {

        //EmpName = getActivity().getSharedPreferences("mypref", Context.MODE_PRIVATE).getString("user_id",null);

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("role", 2);
            jsonObject.put("user_id", user_id);
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url_request, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);
                try {
                    JSONArray jsonArray = new JSONArray(response);

                    mRequestList.clear();

                    for(int i=0; i< jsonArray.length(); i++) {
                        JSONObject requests = jsonArray.getJSONObject(i);

                        String RequestId = requests.getString("request_id");
                        String RequestTitle = requests.getString("title");
                        String date = requests.getString("date");
                        String time = requests.getString("time");
                        String name = requests.getString("name");
                        String location = requests.getString("city");
                        EmpName = requests.getString("empName");

                        mRequestList.add(new RequestCard(RequestId, RequestTitle, name, date, time, location));
                    }

                    RequestAdapter mRequestAdapter = new RequestAdapter(root.getContext(), mRequestList);
                    mRequestAdapter.notifyDataSetChanged();
                    mRecyclerView.setAdapter(mRequestAdapter);
                    mRequestAdapter.setOnItemClickListener(new RequestAdapter.OnItemClickListener() {
                        @Override
                        public void onItemClick(int position) {
                            Intent detailRequest = new Intent(getActivity(), RequestDetails.class);
                            RequestCard clickedItem = mRequestList.get(position);

                            detailRequest.putExtra("requestId", clickedItem.getRequestId());
                            detailRequest.putExtra("empName", EmpName);

                            startActivity(detailRequest);
                        }
                    });
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
}