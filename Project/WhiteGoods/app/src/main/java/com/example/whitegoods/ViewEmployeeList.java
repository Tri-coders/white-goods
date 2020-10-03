package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class ViewEmployeeList extends AppCompatActivity {

    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_employee_list);

        FloatingActionButton newEmployee = findViewById(R.id.add_button);
        newEmployee.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent registerEmployee = new Intent(ViewEmployeeList.this, RegisterEmployee.class);
                startActivity(registerEmployee);
            }
        });

        ArrayList<ViewEmpListRecylerCards> exampleList = new ArrayList<>();
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.fridge, "Employee 1", "Line 2"));
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.oven, "Employee 2", "Line 2"));
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.ac, "Employee 3", "Line 2"));
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.fridge, "Employee 4", "Line 2"));
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.oven, "Employee 5", "Line 2"));
        exampleList.add(new ViewEmpListRecylerCards(R.drawable.ac, "Employee 6", "Line 2"));


        mRecyclerView = findViewById(R.id.employeeRecyclerView);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mAdapter = new ViewEmpListRecylerAdapter(exampleList);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setAdapter(mAdapter);


    }
}