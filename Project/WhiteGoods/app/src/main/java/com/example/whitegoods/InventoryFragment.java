package com.example.whitegoods;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;

public class InventoryFragment extends Fragment {
    CardView fridge;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View root = inflater.inflate(R.layout.fragment_inventory, container, false);
        fridge = root.findViewById(R.id.fridge);
        fridge.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openFridge();

            }
        });
        return root;
    }

    public void openFridge(){
        Intent i = new Intent(getActivity(), InventoryDetail.class);
        startActivity(i);
     }
}