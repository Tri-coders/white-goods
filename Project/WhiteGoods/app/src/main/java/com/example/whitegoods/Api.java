package com.example.whitegoods;

import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;

public interface Api {

    @FormUrlEncoded
    @POST("file")
    Call<Response_POJO> uploadImage(
            @Field("file") String encodedImage,
            @Field("user_id") int user_id
    );
}
