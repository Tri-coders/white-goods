// Inventory Detail Recycler Adapter
package com.example.whitegoods;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.toolbox.ImageLoader;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class ViewEmpListRecylerAdapter extends RecyclerView.Adapter<ViewEmpListRecylerAdapter.ExampleViewHolder> implements Filterable {
    private Context mContext;
    private ArrayList<ViewEmpListRecylerCards> mExampleList;
    private ArrayList<ViewEmpListRecylerCards> mExampleFilteredList;
    private OnItemClickListener mListener;

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {
                String Key = charSequence.toString();
                if (Key.isEmpty()) {

                    mExampleFilteredList = mExampleList ;

                }
                else {
                    ArrayList<ViewEmpListRecylerCards> lstFiltered = new ArrayList<>();
                    for (ViewEmpListRecylerCards row : mExampleList) {

                        if (row.getName().toLowerCase().contains(Key.toLowerCase())){
                            lstFiltered.add(row);
                        }

                    }

                    mExampleFilteredList = lstFiltered;

                }


                FilterResults filterResults = new FilterResults();
                filterResults.values= mExampleFilteredList;
                return filterResults;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {


                mExampleFilteredList = (ArrayList<ViewEmpListRecylerCards>) filterResults.values;
                notifyDataSetChanged();

            }
        };
    }

    public interface OnItemClickListener {
        void onItemClick(int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        mListener = listener;
    }

    public class ExampleViewHolder extends RecyclerView.ViewHolder {
        public ImageView mImageView;
        public TextView mUserId, mName, mRole, mEmail, mPhone, mAddress, mCity, mPin;

        CardView container;
        public ExampleViewHolder(@NonNull View itemView) {
            super(itemView);
            container = itemView.findViewById(R.id.box);
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
        mExampleFilteredList = exampleList;
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
        ViewEmpListRecylerCards currentItem = mExampleFilteredList.get(position);
        holder.mUserId.setText(currentItem.getUserId());
        holder.mName.setText(currentItem.getName());
        holder.mRole.setText(currentItem.getRole());
        holder.mEmail.setText(currentItem.getEmail());
        holder.mPhone.setText(currentItem.getPhone());
        holder.mAddress.setText(currentItem.getAddress());
        holder.mCity.setText(currentItem.getCity());
        holder.mPin.setText(currentItem.getPin());

        Picasso.get().load(currentItem.getImageResource()).into(holder.mImageView);

        //animation code
        holder.container.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_scale_animation_recycler));

    }

    @Override
    public int getItemCount() {
        return mExampleFilteredList.size();
    }
}
