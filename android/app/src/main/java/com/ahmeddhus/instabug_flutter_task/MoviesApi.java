package com.ahmeddhus.instabug_flutter_task;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;


//This class make a network request to the MovieDB API
//and returns the JSON data as a String.
public class MoviesApi {

    // This executor is used to run the network request on a background thread.
    private static final Executor executor = Executors.newSingleThreadExecutor();

    // This method makes a network request to the Movies API
    // and returns the JSON data as a String.
    public static void getMovies(String urlString, final Callback<String> callback) {
        executor.execute(() -> {
            try {
                URL url = new URL(urlString);

                // Make the network request.
                // The HttpURLConnection class is used to make network requests.
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                // The request method is set to GET.
                // This means that the request will only retrieve data.
                connection.setRequestMethod("GET");

                // The connect method is called to establish a connection to the server.
                InputStream inputStream = connection.getInputStream();

                // The response data is read from the InputStream.
                Scanner scanner = new Scanner(inputStream);

                // The JSON data is read from the InputStream and stored in a String.
                StringBuilder builder = new StringBuilder();

                // The Scanner class is used to read the data from the InputStream.
                while (scanner.hasNextLine()) {
                    // The nextLine method is called to read the next line of data.
                    builder.append(scanner.nextLine());
                }

                // The JSON data is returned as a String.
                String json = builder.toString();

                // The callback is called to return the JSON data.
                callback.onSuccess(json);

            } catch (IOException e) {
                // If an error occurs, the onError method is called.
                callback.onError(e);
            }
        });
    }

    // This interface is used to return the JSON data to the caller.
    public interface Callback<T> {
        void onSuccess(T data);

        void onError(Exception e);
    }
}

