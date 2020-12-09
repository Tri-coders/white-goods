package com.example.whitegoods;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter;
import com.github.mikephil.charting.formatter.ValueFormatter;
import com.github.mikephil.charting.utils.ColorTemplate;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;
import java.util.Set;

import static android.content.Context.MODE_PRIVATE;

public class ManagerHomeFragment extends Fragment {
    BarChart barChart;
    Button button1;
    View root;

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";
    private String server_url_edit;

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        server_url_edit =  getString(R.string.host_url) + "/graph_details";
        root = inflater.inflate(R.layout.fragment_manager_home, container, false);

        LogOut();
        graph();
        button_onclick();
        return root;
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

    private void graph() {
        final JSONObject jsonObject = new JSONObject();
        final String requestBody = jsonObject.toString();

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_url_edit, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                JSONArray jsonArray = null;
                HashMap<Integer,Integer> hash_map = new HashMap<>();
                try {
                    jsonArray = new JSONArray(response);

                    for(int i=0; i< jsonArray.length(); i++) {
                        String[] check;
                        JSONObject requests = jsonArray.getJSONObject(i);
                        int l = jsonArray.length();
                        String date = requests.getString("date");
                        int item_cost = Integer.parseInt(requests.getString("item_cost"));
                        check = date.split("/",3);
                        int month = Integer.parseInt(check[1]);
                        if(hash_map.containsKey(month)){
                            hash_map.put(month,hash_map.get(month)+item_cost);
                        }else{
                            hash_map.put(month,item_cost);
                        }
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                BarGraph(hash_map);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
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

        RequestQueue requestQueue = Volley.newRequestQueue(this.requireContext());
        requestQueue.add(stringRequest); // get response from server
    }

    private void BarGraph(HashMap<Integer,Integer> hash_map){
        barChart = root.findViewById(R.id.barChart);

        ArrayList<BarEntry> visitors = new ArrayList<>();
        Set<Integer> keys = hash_map.keySet();

        for(Integer key: keys){
            visitors.add(new BarEntry(key, hash_map.get(key)));
        }

//        visitors.add(new BarEntry(1, 420));
//        visitors.add(new BarEntry(2, 700));
//        visitors.add(new BarEntry(3, 940));
//        visitors.add(new BarEntry(4, 380));
//        visitors.add(new BarEntry(5, 260));
//        visitors.add(new BarEntry(6, 640));
//        visitors.add(new BarEntry(7, 640));
//        visitors.add(new BarEntry(8, 260));
//        visitors.add(new BarEntry(9, 640));
//        visitors.add(new BarEntry(10, 640));
//        visitors.add(new BarEntry(11, 260));
//        visitors.add(new BarEntry(12, 640));

        String[] xAxisLables = new String[]{"Nothing","Jan","Feb", "Mar", "Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
        barChart.getXAxis().setValueFormatter(new IndexAxisValueFormatter(xAxisLables));

        BarDataSet barDataSet = new BarDataSet(visitors, "visitors");
        barDataSet.setColors(ColorTemplate.MATERIAL_COLORS);
        barDataSet.setValueTextColor(Color.BLACK);
        barDataSet.setValueTextSize(10f);

        BarData barData = new BarData(barDataSet);

        barChart.setFitBars(true);
        barChart.setData(barData);
        barChart.getDescription().setText("Bar Chart Example");
        barChart.animateY(2000);

    }

    private void button_onclick(){
        button1 = root.findViewById(R.id.productReport);

        button1.setOnClickListener(view -> {
            Intent i = new Intent(getActivity(), ProductReport.class);
            startActivity(i);
        });
    }

}
