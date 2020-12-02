package com.example.whitegoods;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

public class RequestFragment extends Fragment implements View.OnClickListener {
    View root;
    Button newButton, resButton, susButton, canButton;

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_request, container, false);
        newButton = root.findViewById(R.id.newButton);
        resButton = root.findViewById(R.id.resButton);
        susButton = root.findViewById(R.id.susButton);
        canButton = root.findViewById(R.id.canButton);

        setClickListener();

        floatingActionButtonCall();

        return root;
    }

    private void floatingActionButtonCall() {

        FloatingActionButton newReq = root.findViewById(R.id.add_req);
        newReq.setOnClickListener(view -> {
            Intent i = new Intent(getActivity(), CreateRequest.class);
            startActivity(i);
        });

    }

    public void setClickListener() {
        newButton.setOnClickListener(this);
        resButton.setOnClickListener(this);
        susButton.setOnClickListener(this);
        canButton.setOnClickListener(this);
    }


    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.newButton:
                newButton.setBackgroundResource(R.color.main);
                newButton.setTextColor(Color.parseColor("#ffffff"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

            case R.id.resButton:
                resButton.setBackgroundResource(R.color.main);
                resButton.setTextColor(Color.parseColor("#ffffff"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

                case R.id.susButton:
                susButton.setBackgroundResource(R.color.main);
                susButton.setTextColor(Color.parseColor("#ffffff"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));

                canButton.setBackgroundResource(R.color.elements);
                canButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;

                case R.id.canButton:
                canButton.setBackgroundResource(R.color.main);
                canButton.setTextColor(Color.parseColor("#ffffff"));

                susButton.setBackgroundResource(R.color.elements);
                susButton.setTextColor(Color.parseColor("#B9C2CB"));

                newButton.setBackgroundResource(R.color.elements);
                newButton.setTextColor(Color.parseColor("#B9C2CB"));

                resButton.setBackgroundResource(R.color.elements);
                resButton.setTextColor(Color.parseColor("#B9C2CB"));
                break;
        }

    }

}
