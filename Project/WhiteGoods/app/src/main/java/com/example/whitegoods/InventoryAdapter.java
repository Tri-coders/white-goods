package com.example.whitegoods;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class InventoryAdapter extends RecyclerView.Adapter<InventoryAdapter.InventoryVIewHolder> {

    private Context mContext;
    private ArrayList<InventoryCards> mInventoryList;

    public InventoryAdapter(Context context, ArrayList<InventoryCards> inventorylist) {
        mContext = context;
        mInventoryList = inventorylist;
    }

    @NonNull
    @Override
    public InventoryVIewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View v = LayoutInflater.from(mContext).inflate(R.layout.recycler_inventory_cards, parent, false);
        return new InventoryVIewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull InventoryVIewHolder holder, int position) {
        InventoryCards currentCard = mInventoryList.get(position);

        String prodImage = currentCard.getProdUrl();
        String prodName = currentCard.getProdName();
        String prodPrice = currentCard.getProdPrice();
        String prodQuantity = currentCard.getProdQuantity();

        holder.mProdName.setText(prodName);
        holder.mProdPrice.setText(prodPrice);
        holder.mProdQuantity.setText(prodQuantity);

        Picasso.get().load(prodImage).error(R.drawable.ic_baseline_person_24).into(holder.mProdImage, new Callback() {
            @Override
            public void onSuccess() {

            }

            @Override
            public void onError(Exception e) {
                Log.i("picasso", "" + e);
            }
        });

        holder.container.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_scale_animation_recycler));

    }

    @Override
    public int getItemCount() {
        return mInventoryList.size();
    }

    public class InventoryVIewHolder extends RecyclerView.ViewHolder {

        LinearLayout container;
        public ImageView mProdImage;
        public TextView mProdName, mProdQuantity, mProdPrice;

        public InventoryVIewHolder(@NonNull View itemView) {
            super(itemView);
            container = itemView.findViewById(R.id.container);
            mProdImage = itemView.findViewById(R.id.pimage);
            mProdName = itemView.findViewById(R.id.prod_name);
            mProdPrice = itemView.findViewById(R.id.prod_price);
            mProdQuantity = itemView.findViewById(R.id.quantity);
        }
    }
}
