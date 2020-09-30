package com.example.whitegoods;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;

import com.google.android.material.bottomsheet.BottomSheetDialog;

public class EditProfile extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        ImageButton buttonShow = findViewById(R.id.saveProfile);
        buttonShow.setOnClickListener((View.OnClickListener) view -> {
            BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(
                    EditProfile.this, R.style.BottomSheetDialogTheme
            );

            View bottomSheetView = LayoutInflater.from(getApplicationContext()).inflate(
                    R.layout.layout_bottom_sheet,
                    (LinearLayout)findViewById(R.id.bottomSheetContainer)
            );
            bottomSheetDialog.setContentView(bottomSheetView);
            bottomSheetDialog.show();
        });
    }
}