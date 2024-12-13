package com.example.sanaullah.api;

import com.example.sanaullah.model.TodoModel;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

public interface GetApi {
    @GET("todos")
    Call<List<TodoModel>> getTodo();
}
