package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.google.android.material.bottomsheet.BottomSheetDialog;

import org.florescu.android.rangeseekbar.RangeSeekBar;

import java.util.ArrayList;

public class InventoryDetail extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    ImageButton filterButton;

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

    }

    private void filter() {
        filterButton = findViewById(R.id.filter);

        Toast.makeText(InventoryDetail.this, "Filter Is working", Toast.LENGTH_SHORT).show();

        filterButton.setOnClickListener((View v) -> {
            BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(InventoryDetail.this, R.style.BottomSheetDialogTheme);

            View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(R.layout.layout_bottom_sheet, (LinearLayout) findViewById(R.id.bottomSheetContainer));

            bottomSheetDialog.setContentView(bottomSheetView);
            bottomSheetDialog.show();
        });
    }

}