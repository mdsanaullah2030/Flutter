package com.example.sanaullah.apiClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
public class ApiClient {

    private static final String BASE_URL = "https://675bfa559ce247eb1938140d.mockapi.io/api/v1/";
    private static Retrofit retrofit;

    public static Retrofit getRetrofit(){

        if (retrofit==null){
            retrofit = new Retrofit.Builder()
                    .baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();
        }

        return retrofit;

    }
}
