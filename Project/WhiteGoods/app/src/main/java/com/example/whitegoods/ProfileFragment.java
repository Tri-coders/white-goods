package com.example.whitegoods;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

import static android.content.Context.MODE_PRIVATE;

public class ProfileFragment extends Fragment {

    View root;

    int save_or_edit = 0; // 0 = view state, 1 = edit state

    private RequestQueue requestQueue;

    ImageButton profilePic, saveEditTop;
    EditText mEmail, mName, mPhone, mAddress, mCity, mPincode;
    CheckBox mInstall, mUpgrade, mInventory, mDemo;
    Button saveEditBottom, delete;
    TextView profileTitle;

    String server_get_employee_data_url, server_edit_data_url, user_id;
    char isDemo, isInstall, isUpgrade, isInventory;

    ProgressBar progressBar;

    private static final String KEY_ID = "user_id";

    SharedPreferences sharedPreferences;

    private static final String SHARED_PREF_NAME = "mypref";

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        root = inflater.inflate(R.layout.activity_admin_edit_profile, container, false);

        server_edit_data_url = getString(R.string.host_url) + "/edit_employee_admin";
        server_get_employee_data_url = getString(R.string.host_url) + "/get_user_details";

        sharedPreferences = getActivity().getSharedPreferences(SHARED_PREF_NAME, MODE_PRIVATE);
        user_id = sharedPreferences.getString(KEY_ID, null);

        profileTitle = root.findViewById(R.id.profile);

        setElements();

        requestQueue = Volley.newRequestQueue(getActivity());
        getUserData();

        onEditClicked();

        profilePic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getActivity(), "PIC Clicked", Toast.LENGTH_SHORT).show();
            }
        });

        return root;
    }

    private void onEditClicked() {
        saveEditTop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saveEditBottom.performClick();
            }
        });

        saveEditBottom.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(save_or_edit == 0) {
                    profileTitle.setText("Edit Profile");
                    saveEditBottom.setText("Save");
                    save_or_edit = 1;

                    mAddress.setEnabled(true);
                    mCity.setEnabled(true);
                    mPincode.setEnabled(true);

                    saveEditTop.setBackgroundResource(R.drawable.ic_baseline_save_24);

                } else {
                    saveEditBottom.setText("Edit");
                    profileTitle.setText("Profile");
                    save_or_edit = 0;

                    mAddress.setEnabled(false);
                    mCity.setEnabled(false);
                    mPincode.setEnabled(false);

                    saveEditTop.setBackgroundResource(R.drawable.ic_baseline_edit_24);

                    editAdmin();
                }
            }
        });
    }

    private void editAdmin() {

        if(mDemo.isChecked()) {
            isDemo = '1';
        } else {
            isDemo = '0';
        }

        if(mInstall.isChecked()) {
            isInstall = '1';
        } else {
            isInstall = '0';
        }

        if(mInventory.isChecked()) {
            isInventory = '1';
        } else {
            isInventory = '0';
        }

        if(mUpgrade.isChecked()) {
            isUpgrade = '1';
        } else {
            isUpgrade = '0';
        }

        String nameText = String.valueOf(mName.getText());
        String emailText = String.valueOf(mEmail.getText());
        String mobileText = String.valueOf(mPhone.getText());
        String addressText = String.valueOf(mAddress.getText());
        String cityText = String.valueOf(mCity.getText());
        String pinText = String.valueOf(mPincode.getText());

        progressBar.setVisibility(View.VISIBLE);
        saveEditBottom.setEnabled(false);

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user_id", user_id);
            jsonObject.put("name", nameText);
            jsonObject.put("email", emailText);
            jsonObject.put("contact", mobileText);
            jsonObject.put("address", addressText);
            jsonObject.put("city", cityText);
            jsonObject.put("pin", pinText);
            jsonObject.put("install", "" + isInstall);
            jsonObject.put("demo", "" + isDemo);
            jsonObject.put("inventory", "" + isInventory);
            jsonObject.put("upgrade", "" + isUpgrade);

            Log.i("checkdata", jsonObject.toString());
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_edit_data_url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);

                progressBar.setVisibility(View.INVISIBLE);
                saveEditBottom.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));

                Toast.makeText(getActivity(), "Success", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    progressBar.setVisibility(View.INVISIBLE);
                    saveEditBottom.setEnabled(true);
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(getActivity(), "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(getActivity(), "Check Network", Toast.LENGTH_SHORT).show();
                }
            }
        }) {
            //sending JSONObject String to server starts
            @Override
            public byte[] getBody() throws AuthFailureError {
                try {
                    return requestBody.getBytes("utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    return null;
                }
            }

            @Override
            public String getBodyContentType() {
                return "application/json; charset=utf-8";
            }
        };
        //sending JSONObject String to server ends

        requestQueue.add(stringRequest); // get response from server
    }

    private void getUserData() {

        final JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("user_id", user_id);
        }
        catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, server_get_employee_data_url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);
                try {
                    JSONObject data = new JSONObject(response);

                    String userId = data.getString("user_id");
                    String name = data.getString("name");
                    String address = data.getString("address");
                    String city = data.getString("city");
                    String pin = data.getString("pin");
                    String contact = data.getString("contact");
                    String email = data.getString("email");
                    String imageUrl = data.getString("image");

                    String install = data.getString("install");
                    String inventory = data.getString("inventory");
                    String demo = data.getString("demo");
                    String upgrade = data.getString("upgrade");

                    Picasso.get().load(imageUrl).error(R.drawable.ic_baseline_person_24).into(profilePic, new Callback() {
                        @Override
                        public void onSuccess() {

                        }

                        @Override
                        public void onError(Exception e) {
                            Log.i("picasso", "" + e);
                        }
                    });

                    mEmail.setText(email);
                    mPhone.setText(contact);
                    mName.setText(name);
                    mAddress.setText(address);
                    mCity.setText(city);
                    mPincode.setText(pin);
                    if(install.equals("1")) {
                        mInstall.setChecked(true);
                    }
                    if(upgrade.equals("1")) {
                        mUpgrade.setChecked(true);
                    }
                    if(demo.equals("1")) {
                        mDemo.setChecked(true);
                    }
                    if(inventory.equals("1")) {
                        mInventory.setChecked(true);
                    }

                }
                catch (JSONException e) {
                    e.printStackTrace();
                }
                Toast.makeText(getActivity(), "Received user data", Toast.LENGTH_SHORT).show();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));
                    Toast.makeText(getActivity(), "Invalid Credentials", Toast.LENGTH_SHORT).show();

                    error.printStackTrace();
                }
                catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
                    Toast.makeText(getActivity(), "Check Network", Toast.LENGTH_SHORT).show();
                }
            }
        }) {
            //sending JSONObject String to server starts
            @Override
            public byte[] getBody() throws AuthFailureError {
                try {
                    return requestBody.getBytes("utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    return null;
                }
            }

            @Override
            public String getBodyContentType() {
                return "application/json; charset=utf-8";
            }
        };
        //sending JSONObject String to server ends

        requestQueue.add(stringRequest); // get response from server
    }

    private void setElements() {

        saveEditTop = root.findViewById(R.id.saveProfile);
        profilePic = root.findViewById(R.id.edit_pic);
        mEmail = root.findViewById(R.id.email_admin);
        mName = root.findViewById(R.id.name_admin);
        mPhone = root.findViewById(R.id.phone_admin);
        mAddress = root.findViewById(R.id.address_admin);
        mCity = root.findViewById(R.id.city_admin);
        mPincode = root.findViewById(R.id.pincode_admin);
        mInstall = root.findViewById(R.id.install_admin);
        mUpgrade = root.findViewById(R.id.upgrade_admin);
        mInventory = root.findViewById(R.id.inventory_admin);
        mDemo = root.findViewById(R.id.demo_admin);
        saveEditBottom = root.findViewById(R.id.saveEdit_admin);
        delete = root.findViewById(R.id.delete);
        progressBar=root.findViewById(R.id.progressBar_admin);

        delete.setVisibility(View.GONE);
    }

}