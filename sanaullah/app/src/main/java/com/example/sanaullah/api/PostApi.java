package com.example.sanaullah.api;


import com.example.sanaullah.model.TodoModel;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;
public interface PostApi {
    @POST("todos")
    Call<Void> createTodo(@Body TodoModel todo);

}
