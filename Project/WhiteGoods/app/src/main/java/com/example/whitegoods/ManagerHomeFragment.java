package com.example.whitegoods;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.util.ArrayList;

import static android.content.Context.MODE_PRIVATE;

public class ManagerHomeFragment extends Fragment {
    BarChart barChart;
    Button button1;
    View root;

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_manager_home, container, false);

        LogOut();
        BarGraph();
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

    private void BarGraph(){
        barChart = root.findViewById(R.id.barChart);

        ArrayList<BarEntry> visitors = new ArrayList<>();
        visitors.add(new BarEntry(2014, 420));
        visitors.add(new BarEntry(2015, 700));
        visitors.add(new BarEntry(2016, 940));
        visitors.add(new BarEntry(2017, 380));
        visitors.add(new BarEntry(2018, 260));
        visitors.add(new BarEntry(2019, 640));
        visitors.add(new BarEntry(2019, 640));

        BarDataSet barDataSet = new BarDataSet(visitors, "visitors");
        barDataSet.setColors(ColorTemplate.MATERIAL_COLORS);
        barDataSet.setValueTextColor(Color.BLACK);
        barDataSet.setValueTextSize(16f);


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
