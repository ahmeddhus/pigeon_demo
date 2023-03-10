package com.ahmeddhus.instabug_flutter_task;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.Pigeon.*;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {

    // This class implements the generated MoviesHostApi interface.
    // The generated MoviesHostApi interface is a simple interface that allows
    // the Dart side of the app to send messages to the Java side of the app.
    class MyApi implements MoviesHostApi {

        // This method is called when the Dart side of the app sends a message
        // to the Java side of the app using the MoviesHostApi.getMovies method.
        // The method is called with a MoviesRequest object that contains the
        // data sent from the Dart side of the app.
        @Override
        public void getMovies(@NonNull String apiKey, Result<Object> result) {
            MoviesApi.getMovies(apiKey, new MoviesApi.Callback<>() {
                @Override
                public void onSuccess(String data) {
                    // The MoviesApi.getMovies method returns a String
                    // that contains the JSON data.
                    result.success(data);
                }

                @Override
                public void onError(Exception e) {
                    // If an error occurs, the MoviesApi.getMovies method
                    // calls the onError method with an Exception object.
                    result.error(e);
                }
            });
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        // Setup Pigeon to handle messages from the Dart side of the app.
        MoviesHostApi.setup(flutterEngine.getDartExecutor(), new MyApi());
    }
}
