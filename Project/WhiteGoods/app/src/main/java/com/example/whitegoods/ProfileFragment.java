package com.example.whitegoods;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class ProfileFragment extends Fragment {
    ImageButton edit;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.activity_admin_edit_profile, container, false);
        Toast.makeText(getActivity(), "THis is Fragment", Toast.LENGTH_SHORT).show();
        edit = (ImageButton) root.findViewById(R.id.saveProfile);
        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                edit_profile();
            }
        });
        return root;
    }
    public void edit_profile(){
        Toast.makeText(getActivity(), "EDit clicked", Toast.LENGTH_SHORT).show();
    }
    }