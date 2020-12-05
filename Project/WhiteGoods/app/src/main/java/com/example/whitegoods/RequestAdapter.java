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
    private OnItemClickListener mListener;

    public interface OnItemClickListener {
        void onItemClick(int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        mListener = listener;
    }

    public RequestAdapter(Context context, ArrayList<RequestCard> RequestList) {
        mContext = context;
        mRequestList = RequestList;
    }

    @NonNull
    @Override
    public RequestViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(mContext).inflate(R.layout.recycler_requests_card, parent, false);
        return new RequestViewHolder(v,mListener);
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

    public static class RequestViewHolder extends RecyclerView.ViewHolder {
        public TextView mRequestId, mRequestTitle, mDate, mTime, mLocation, mEmpName;

        public RequestViewHolder(@NonNull View itemView, OnItemClickListener listner) {
            super(itemView);

            mRequestId = itemView.findViewById(R.id.request_id);
            mRequestTitle = itemView.findViewById(R.id.rTitle);
            mDate = itemView.findViewById(R.id.date);
            mTime = itemView.findViewById(R.id.time);
            mLocation = itemView.findViewById(R.id.city);
            mEmpName = itemView.findViewById(R.id.eName);

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if(listner!=null) {
                        int position = getAdapterPosition();
                        if(position != RecyclerView.NO_POSITION) {
                            listner.onItemClick(position);
                        }
                    }
                }
            });
        }
    }
}
