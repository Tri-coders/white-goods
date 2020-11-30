package com.example.whitegoods.fcmservice;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.whitegoods.R;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.InstanceIdResult;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class FcmTokenReceiver extends IntentService {

    /**
     * @param name
     * @deprecated
     */
    String token = "";

    public FcmTokenReceiver() {
        super("FcmTokenRegistrationService");
    }

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {


        FirebaseInstanceId.getInstance().getInstanceId()
                .addOnCompleteListener(new OnCompleteListener<InstanceIdResult>() {
                    @Override
                    public void onComplete(@NonNull Task<InstanceIdResult> task) {
                        if (!task.isSuccessful()) {
                            Log.d("Firebas failed ", task.getException().toString());
                            return;
                        }
                        // Get new Instance ID token
                        token = task.getResult().getToken();
                        Log.d("registrationToken= ", token);
                        sendTokenToServer(token);

                    }
                });

    }

    private void sendTokenToServer(String token) {

        final JSONObject jsonObject = new JSONObject();
        try {
            SharedPreferences pref = getSharedPreferences("mypref", Context.MODE_PRIVATE);
            SharedPreferences.Editor edit = pref.edit();
            edit.putString("token",token);
            edit.apply();
            String user_id = getSharedPreferences("mypref", Context.MODE_PRIVATE).getString("user_id",null);


            jsonObject.put("token", token);
            jsonObject.put("user_id", Integer.parseInt(user_id));

            Log.i("checkdata", jsonObject.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }

        final String requestBody = jsonObject.toString();
        Log.i("VolleyABC", requestBody);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, getString(R.string.host_url) + "/token", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.i("VolleyABC", "got response " + response);
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
//                progressBar.setVisibility(View.INVISIBLE);
//                saveEditBottom.setEnabled(true);
                //regEmployee.setBackgroundColor(Color.parseColor("#0075FF"));
                try {
                    Log.i("VolleyABC", error.toString());
                    Log.i("VolleyABC", Integer.toString(error.networkResponse.statusCode));

                    error.printStackTrace();
                } catch (Exception e) {
                    Log.i("VolleyABC", e.toString());
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

        stringRequest.setRetryPolicy(new DefaultRetryPolicy(6000,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

        //sending JSONObject String to server ends

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest); // get response from server
    }
}
