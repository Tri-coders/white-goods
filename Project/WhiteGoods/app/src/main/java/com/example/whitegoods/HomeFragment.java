package com.example.whitegoods;

import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import org.florescu.android.rangeseekbar.RangeSeekBar;

import java.util.ArrayList;

public class HomeFragment extends Fragment {
//    RangeSeekBar rangeSeekBar;
    BarChart barChart;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View root = inflater.inflate(R.layout.fragment_home, container, false);

//        rangeSeekBar = root.findViewById(R.id.seekbar);
//
//
//        rangeSeekBar.setSelectedMinValue(0);
//        rangeSeekBar.setSelectedMaxValue(0);
//
//        rangeSeekBar.setOnRangeSeekBarChangeListener(new RangeSeekBar.OnRangeSeekBarChangeListener() {
//            @Override
//            public void onRangeSeekBarValuesChanged(RangeSeekBar bar, Number minValue, Number maxValue) {
//                Number min_value = bar.getSelectedMinValue();
//                Number max_value = bar.getSelectedMaxValue();
//
//                int min = (int) min_value;
//                int max = (int) max_value;
//                Toast.makeText(getContext(), "Min-" + min + "\n" + "Max-" + max, Toast.LENGTH_SHORT).show();
//
//            }
//        });

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



        return root;
    }
}