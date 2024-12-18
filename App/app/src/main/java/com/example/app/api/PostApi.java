package com.example.app.api;

import com.example.app.model.TodoModel;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface PostApi {
    @POST("todoapps")
    Call<Void> createTodo(@Body TodoModel todo);
}
