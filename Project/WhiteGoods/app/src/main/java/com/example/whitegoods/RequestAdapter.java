package com.example.whitegoods;

import android.content.Context;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class RequestAdapter extends RecyclerView.Adapter<RequestAdapter.RequestViewHolder> {
    private Context mContext;
    private ArrayList<RequestCard> mRequestList;

    public RequestAdapter(Context context, ArrayList<RequestCard> RequestList) {
        mContext = context;
        mRequestList = RequestList;
    }

    @NonNull
    @Override
    public RequestViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(mContext).inflate(R.layout.recycler_requests_card, parent, false);
        return new RequestViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull RequestViewHolder holder, int position) {
        RequestCard currentItem = mRequestList.get(position);

        holder.mRequestId.setText(currentItem.getRequestId());
        holder.mRequestTitle.setText(currentItem.getRequestTitle());
        holder.mEmpName.setText(currentItem.getEmpName());
        holder.mDate.setText(currentItem.getDate());
        holder.mTime.setText(currentItem.getTime());
        holder.mLocation.setText(currentItem.getLocation());
    }

    @Override
    public int getItemCount() {
        return mRequestList.size();
    }

    public class RequestViewHolder extends RecyclerView.ViewHolder {
        public TextView mRequestId, mRequestTitle, mDate, mTime, mLocation, mEmpName;

        public RequestViewHolder(@NonNull View itemView) {
            super(itemView);

            mRequestId = itemView.findViewById(R.id.request_id);
            mRequestTitle = itemView.findViewById(R.id.rTitle);
            mDate = itemView.findViewById(R.id.date);
            mTime = itemView.findViewById(R.id.time);
            mLocation = itemView.findViewById(R.id.city);
            mEmpName = itemView.findViewById(R.id.eName);
        }
    }
}
