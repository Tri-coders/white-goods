package com.example.whitegoods;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import org.florescu.android.rangeseekbar.RangeSeekBar;

public class HomeFragment extends Fragment {
    RangeSeekBar rangeSeekBar;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View root = inflater.inflate(R.layout.fragment_home, container, false);

        rangeSeekBar = root.findViewById(R.id.seekbar);

        rangeSeekBar.setSelectedMinValue(0);
        rangeSeekBar.setSelectedMaxValue(0);

        rangeSeekBar.setOnRangeSeekBarChangeListener(new RangeSeekBar.OnRangeSeekBarChangeListener() {
            @Override
            public void onRangeSeekBarValuesChanged(RangeSeekBar bar, Number minValue, Number maxValue) {
                Number min_value = bar.getSelectedMinValue();
                Number max_value = bar.getSelectedMaxValue();

                int min = (int)min_value;
                int max = (int)max_value;
                Toast.makeText(getContext(), "Min-"+min+"\n"+"Max-"+max, Toast.LENGTH_SHORT).show();

            }
        });

        return root;
    }
}