package com.example.whitegoods;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;

public class RequestPreviewDialog extends AppCompatDialogFragment {

    TextView mEmpName, mTitle, mDesc, mCustName, mCustAddress, mCustCity, mCustPin, mCustEmail, mTime, mDate, mCustphone;
    TextView mServiceCharge, mItemCost, mDiscount, mTotalCost;

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

        LayoutInflater inflater = getActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.layout_dialog_request_preview, null);

        setElements(view);

        builder.setView(view)
                .setTitle("Preview")
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {

                    }
                })
                .setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Toast.makeText(getActivity(), "success", Toast.LENGTH_SHORT).show();
                    }
                });

        return builder.create();
    }

    private void setElements(View view) {

        mEmpName = view.findViewById(R.id.emp_name);
        mTitle = view.findViewById(R.id.request_title);
        mDesc = view.findViewById(R.id.request_description);
        mCustName = view.findViewById(R.id.request_cust_name);
        mCustAddress = view.findViewById(R.id.request_cust_address);
        mCustCity = view.findViewById(R.id.request_cust_city);
        mCustPin = view.findViewById(R.id.request_cust_pin);
        mCustEmail = view.findViewById(R.id.request_cust_email);
        mTime = view.findViewById(R.id.request_time);
        mDate = view.findViewById(R.id.request_date);
        mCustphone = view.findViewById(R.id.request_cust_phone);
        mServiceCharge = view.findViewById(R.id.request_service);
        mItemCost = view.findViewById(R.id.item_cost);
        mDiscount = view.findViewById(R.id.discount);
        mTotalCost = view.findViewById(R.id.total_cost);

        mTitle.setText(this.getArguments().getString("title"));
        mDesc.setText(this.getArguments().getString("description"));
        mCustName.setText(this.getArguments().getString("name"));
        mCustAddress.setText(this.getArguments().getString("address"));
        mCustCity.setText(this.getArguments().getString("city"));
        mCustPin.setText(this.getArguments().getString("pincode"));
        mCustEmail.setText(this.getArguments().getString("email"));
        mTime.setText(this.getArguments().getString("time"));
        mDate.setText(this.getArguments().getString("date"));
        mCustphone.setText(this.getArguments().getString("phone"));
        mServiceCharge.setText(this.getArguments().getString("serviceCharge"));
        mItemCost.setText(this.getArguments().getString("itemCost"));
        mDiscount.setText(this.getArguments().getString("discount"));
        mTotalCost.setText(this.getArguments().getString("totalCost"));
        mEmpName.setText(this.getArguments().getString("empName"));
    }
}
