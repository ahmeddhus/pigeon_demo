package com.ahmeddhus.instabug_flutter_task;

import io.flutter.embedding.android.FlutterActivity;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import io.flutter.plugins.Pigeon.*;
import io.flutter.embedding.android.FlutterActivity;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    class MyApi implements MoviesApi {
        @NonNull
        @Override
        public List<Movie> getMovies(@NonNull Long pageNumber) {
            List<Movie> movies = new ArrayList<>();

            //Dummy data just for testing
            Movie exampleMovie = new Movie();
            exampleMovie.setTitle("The Shawshank Redemption");
            exampleMovie.setDate("1994");
            movies.add(exampleMovie);

            return movies;
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        MoviesApi.setup(flutterEngine.getDartExecutor(), new MyApi());
    }
}
