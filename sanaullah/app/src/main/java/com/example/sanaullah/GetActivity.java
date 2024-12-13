package com.example.sanaullah;

import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.sanaullah.adapter.TodoAdapter;
import com.example.sanaullah.api.GetApi;
import com.example.sanaullah.apiClient.ApiClient;
import com.example.sanaullah.model.TodoModel;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class GetActivity extends AppCompatActivity {

    private RecyclerView notificationList;
    private TodoAdapter notificationAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get);

        // Handle window insets for edge-to-edge layout
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        // Initialize RecyclerView
        notificationList = findViewById(R.id.noticeList);
        notificationList.setLayoutManager(new LinearLayoutManager(this));

        // Fetch data from the API
        fetchTodoItems();
    }

    private void fetchTodoItems() {
        GetApi notificationApi = ApiClient.getRetrofit().create(GetApi.class);

        Call<List<TodoModel>> call = notificationApi.getTodo();

        call.enqueue(new Callback<List<TodoModel>>() {
            @Override
            public void onResponse(Call<List<TodoModel>> call, Response<List<TodoModel>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    List<TodoModel> todoList = response.body();

                    // Set up RecyclerView adapter
                    notificationAdapter = new TodoAdapter(todoList, GetActivity.this);
                    notificationList.setAdapter(notificationAdapter);
                } else {
                    Log.e("GetActivity", "API Response unsuccessful: " + response.code());
                }
            }

            @Override
            public void onFailure(Call<List<TodoModel>> call, Throwable t) {
                Log.e("GetActivity", "API call failed: " + t.getMessage(), t);
            }
        });
    }
}
