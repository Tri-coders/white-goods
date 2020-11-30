package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.service.autofill.TextValueSanitizer;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.bottomsheet.BottomSheetDialog;

import org.florescu.android.rangeseekbar.RangeSeekBar;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;

import me.bendik.simplerangeview.SimpleRangeView;

public class InventoryDetail extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    ImageButton filterButton, backButton;
    SimpleRangeView rangeBar;
    TextView textView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inventory_detail);

        ArrayList<RecyclerCards> exampleList = new ArrayList<>();
        exampleList.add(new RecyclerCards(R.drawable.fridge, "Line 1", "Line 2"));
        exampleList.add(new RecyclerCards(R.drawable.oven, "Line 2", "Line 2"));
        exampleList.add(new RecyclerCards(R.drawable.ac, "Line 1", "Line 2"));
        exampleList.add(new RecyclerCards(R.drawable.fridge, "Line 1", "Line 2"));
        exampleList.add(new RecyclerCards(R.drawable.oven, "Line 1", "Line 2"));
        exampleList.add(new RecyclerCards(R.drawable.ac, "Line 1", "Line 2"));


        mRecyclerView = findViewById(R.id.recyclerview);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mAdapter = new RecyclerAdapter(exampleList);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setAdapter(mAdapter);


        filter();
        backButton();

    }

    private void filter() {
        filterButton = findViewById(R.id.filter);

        Toast.makeText(InventoryDetail.this, "Filter Is working", Toast.LENGTH_SHORT).show();

        filterButton.setOnClickListener((View v) -> {
            BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(InventoryDetail.this, R.style.BottomSheetDialogTheme);

            View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(R.layout.layout_bottom_sheet, (LinearLayout) findViewById(R.id.bottomSheetContainer));

            rangeBar = bottomSheetView.findViewById(R.id.range_bar);
            textView = bottomSheetView.findViewById(R.id.text_view);

            //rangeBar Code
            rangeBar();

            bottomSheetDialog.setContentView(bottomSheetView);
            bottomSheetDialog.show();
        });
    }

    private void rangeBar() {
        rangeBar.setOnChangeRangeListener(new SimpleRangeView.OnChangeRangeListener() {
            @Override
            public void onRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i, int i1) {
                textView.setText(String.valueOf(i) + "-" + String.valueOf(i1));
            }
        });

        rangeBar.setOnTrackRangeListener(new SimpleRangeView.OnTrackRangeListener() {
            @Override
            public void onStartRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i) {
                textView.setText(String.valueOf(i));

            }

            @Override
            public void onEndRangeChanged(@NotNull SimpleRangeView simpleRangeView, int i) {
                textView.setText(String.valueOf(i));
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

    private void backButton(){
        backButton = findViewById(R.id.back);
        backButton.setOnClickListener(view -> finish());
    }

}