package com.example.whitegoods;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

public class RequestFragment extends Fragment {
    View root;

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        root = inflater.inflate(R.layout.fragment_request, container, false);

        floatingActionButtonCall();

        return root;
    }

    private void floatingActionButtonCall(){

        FloatingActionButton newReq = root.findViewById(R.id.add_req);
        newReq.setOnClickListener(view -> {
            Intent i = new Intent(getActivity(), CreateRequest.class);
            startActivity(i);
        });

    }

}
