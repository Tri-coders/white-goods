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

public class InventoryFragment extends Fragment implements View.OnClickListener {
    CardView fridge, ac, wm, oven;
    Intent i;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View root = inflater.inflate(R.layout.fragment_inventory, container, false);

        fridge = root.findViewById(R.id.fridge);
        ac = root.findViewById(R.id.ac);
        wm = root.findViewById(R.id.wm);
        oven = root.findViewById(R.id.oven);

        setClickListener();
        return root;
    }

    public void setClickListener() {
        fridge.setOnClickListener(this);
        ac.setOnClickListener(this);
        wm.setOnClickListener(this);
        oven.setOnClickListener(this);
    }

    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.ac:
                i = new Intent(getActivity(), InventoryDetail.class);
                i.putExtra("wh_good_category", "1");
                startActivity(i);
                break;
            case R.id.fridge:
                i = new Intent(getActivity(), InventoryDetail.class);
                i.putExtra("wh_good_category", "2");
                startActivity(i);
                break;
            case R.id.oven:
                i = new Intent(getActivity(), InventoryDetail.class);
                i.putExtra("wh_good_category", "3");
                startActivity(i);
                break;
            case R.id.wm:
                i = new Intent(getActivity(), InventoryDetail.class);
                i.putExtra("wh_good_category", "4");
                startActivity(i);
                break;
        }
    }

}