// Inventory Detail Recycler Adapter
package com.example.whitegoods;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.toolbox.ImageLoader;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class ViewEmpListRecylerAdapter extends RecyclerView.Adapter<ViewEmpListRecylerAdapter.ExampleViewHolder> {
    private Context mContext;
    private ArrayList<ViewEmpListRecylerCards> mExampleList;
    private OnItemClickListener mListener;

    public interface OnItemClickListener {
        void onItemClick(int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        mListener = listener;
    }

    public class ExampleViewHolder extends RecyclerView.ViewHolder {
        public ImageView mImageView;
        public TextView mUserId, mName, mRole, mEmail, mPhone, mAddress, mCity, mPin;

        public ExampleViewHolder(@NonNull View itemView) {
            super(itemView);
            mImageView = itemView.findViewById(R.id.pimage);
            mUserId = itemView.findViewById(R.id.user_id);
            mName = itemView.findViewById(R.id.name);
            mRole = itemView.findViewById(R.id.quantity);
            mEmail = itemView.findViewById(R.id.email);
            mPhone = itemView.findViewById(R.id.ph_no);
            mAddress = itemView.findViewById(R.id.address);
            mCity = itemView.findViewById(R.id.city);
            mPin = itemView.findViewById(R.id.pin_code);

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (mListener != null) {
                        int position = getAdapterPosition();
                        if(position != RecyclerView.NO_POSITION) {
                            mListener.onItemClick(position);
                        }
                    }
                }
            });
        }

    }

    public ViewEmpListRecylerAdapter(Context context, ArrayList<ViewEmpListRecylerCards> exampleList) {
        mContext = context;
        mExampleList = exampleList;
    }

    @Override
    @NonNull
    public ExampleViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(mContext).inflate(R.layout.recycler_cards, parent, false);
        ExampleViewHolder evh = new ExampleViewHolder(v);
        return evh;
    }

    @Override
    public void onBindViewHolder(@NonNull ExampleViewHolder holder, int position) {
        ViewEmpListRecylerCards currentItem = mExampleList.get(position);
        holder.mUserId.setText(currentItem.getUserId());
        holder.mName.setText(currentItem.getName());
        holder.mRole.setText(currentItem.getRole());
        holder.mEmail.setText(currentItem.getEmail());
        holder.mPhone.setText(currentItem.getPhone());
        holder.mAddress.setText(currentItem.getAddress());
        holder.mCity.setText(currentItem.getCity());
        holder.mPin.setText(currentItem.getPin());

        Picasso.get().load(currentItem.getImageResource()).into(holder.mImageView);
    }

    @Override
    public int getItemCount() {
        return mExampleList.size();
    }
}
