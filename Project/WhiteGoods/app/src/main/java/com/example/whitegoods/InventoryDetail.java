package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;

public class InventoryDetail extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;

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

    }
}