package com.example.whitegoods;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.sundeepk.compactcalendarview.CompactCalendarView;
import com.github.sundeepk.compactcalendarview.domain.Event;

import org.florescu.android.rangeseekbar.RangeSeekBar;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import static android.content.Context.MODE_PRIVATE;

public class HomeFragment extends Fragment {
    RangeSeekBar rangeSeekBar;
    CompactCalendarView compactCalendar;
    View root;
    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";

    private SimpleDateFormat dateFormatMonth = new SimpleDateFormat("MMM - yyyy", Locale.getDefault());
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_home, container, false);

        LogOut();

        compactCalendar = (CompactCalendarView) root.findViewById(R.id.compactcalendar_view);
        compactCalendar.setUseThreeLetterAbbreviation(true);
        //Setting Event/Schedule

        Event ev1 = new Event(Color.RED, 1601966311000L,"Microwave Repair");
        compactCalendar.addEvent(ev1);
        compactCalendar.setListener(new CompactCalendarView.CompactCalendarViewListener() {
            @Override
            public void onDayClick(Date dateClicked) {
                Context context = getActivity();

                if (dateClicked.toString().compareTo("Tue Oct 06 09:00:00 AST 2020)") ==0 ) {
                    Toast.makeText(context, "Microwave Oven Repiar", Toast.LENGTH_SHORT).show();
                }else{
                    Toast.makeText(context, "No Scheduled Work",Toast.LENGTH_SHORT ).show();
                }
            }
            @Override
            public void onMonthScroll(Date firstDayOfNewMonth) {

            }
        });

        rangeSeekBar = root.findViewById(R.id.seekbar);


        rangeSeekBar.setSelectedMinValue(0);
        rangeSeekBar.setSelectedMaxValue(100);

        rangeSeekBar.setOnRangeSeekBarChangeListener(new RangeSeekBar.OnRangeSeekBarChangeListener() {
            @Override
            public void onRangeSeekBarValuesChanged(RangeSeekBar bar, Number minValue, Number maxValue) {
                Number min_value = bar.getSelectedMinValue();
                Number max_value = bar.getSelectedMaxValue();

                int min = (int) min_value;
                int max = (int) max_value;
                Toast.makeText(getContext(), "Min-" + min + "\n" + "Max-" + max, Toast.LENGTH_SHORT).show();

            }
        });

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
}