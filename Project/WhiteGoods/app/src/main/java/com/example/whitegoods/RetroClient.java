package com.example.whitegoods;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class RetroClient {
    private static final  String BASE_URL="http://128.199.30.114:9000/"; //URL for php files
    private static RetroClient myClient;
    private Retrofit retrofit;

    private RetroClient(){
        retrofit = new Retrofit.Builder().baseUrl(BASE_URL).
                addConverterFactory(GsonConverterFactory.create()).build();
    }

    public static synchronized RetroClient getInstance(){
        if(myClient == null){
            myClient = new RetroClient();
        }
        return myClient;
    }

    public Api getApi(){
        return retrofit.create((Api.class));
    }
}
