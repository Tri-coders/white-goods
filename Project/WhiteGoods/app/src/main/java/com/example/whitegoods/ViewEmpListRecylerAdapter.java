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

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class ViewEmpListRecylerAdapter extends RecyclerView.Adapter<ViewEmpListRecylerAdapter.ExampleViewHolder> {
    private Context mContext;
    private ArrayList<ViewEmpListRecylerCards> mExampleList;

    public static class ExampleViewHolder extends RecyclerView.ViewHolder {
        public ImageView mImageView;
        public TextView mTextView1;
        public TextView mTextView2;

        public ExampleViewHolder(@NonNull View itemView) {
            super(itemView);
            mImageView = itemView.findViewById(R.id.pimage);
            mTextView1 = itemView.findViewById(R.id.name);
            mTextView2 = itemView.findViewById(R.id.quantiity);
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
        holder.mTextView1.setText(currentItem.getText1());
        holder.mTextView2.setText(currentItem.getText2());

        Picasso.get().load(currentItem.getImageResource()).into(holder.mImageView);
    }

    @Override
    public int getItemCount() {
        return mExampleList.size();
    }
}
