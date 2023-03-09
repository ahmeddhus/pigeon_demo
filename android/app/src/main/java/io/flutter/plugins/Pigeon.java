// Autogenerated from Pigeon (v9.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package io.flutter.plugins;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {
  @NonNull
  private static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    errorList.add(exception.toString());
    errorList.add(exception.getClass().getSimpleName());
    errorList.add(
      "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorList;
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class Movie {
    private @Nullable String title;

    public @Nullable String getTitle() {
      return title;
    }

    public void setTitle(@Nullable String setterArg) {
      this.title = setterArg;
    }

    private @Nullable String date;

    public @Nullable String getDate() {
      return date;
    }

    public void setDate(@Nullable String setterArg) {
      this.date = setterArg;
    }

    public static final class Builder {

      private @Nullable String title;

      public @NonNull Builder setTitle(@Nullable String setterArg) {
        this.title = setterArg;
        return this;
      }

      private @Nullable String date;

      public @NonNull Builder setDate(@Nullable String setterArg) {
        this.date = setterArg;
        return this;
      }

      public @NonNull Movie build() {
        Movie pigeonReturn = new Movie();
        pigeonReturn.setTitle(title);
        pigeonReturn.setDate(date);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(2);
      toListResult.add(title);
      toListResult.add(date);
      return toListResult;
    }

    static @NonNull Movie fromList(@NonNull ArrayList<Object> list) {
      Movie pigeonResult = new Movie();
      Object title = list.get(0);
      pigeonResult.setTitle((String) title);
      Object date = list.get(1);
      pigeonResult.setDate((String) date);
      return pigeonResult;
    }
  }

  private static class MoviesHostApiCodec extends StandardMessageCodec {
    public static final MoviesHostApiCodec INSTANCE = new MoviesHostApiCodec();

    private MoviesHostApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return Movie.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof Movie) {
        stream.write(128);
        writeValue(stream, ((Movie) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface MoviesHostApi {

    @NonNull 
    List<Movie> getMovies(@NonNull Long pageNumber);

    /** The codec used by MoviesHostApi. */
    static MessageCodec<Object> getCodec() {
      return MoviesHostApiCodec.INSTANCE;
    }
    /**Sets up an instance of `MoviesHostApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, MoviesHostApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.MoviesHostApi.getMovies", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                try {
                  ArrayList<Object> args = (ArrayList<Object>) message;
                  assert args != null;
                  Number pageNumberArg = (Number) args.get(0);
                  if (pageNumberArg == null) {
                    throw new NullPointerException("pageNumberArg unexpectedly null.");
                  }
                  List<Movie> output = api.getMovies((pageNumberArg == null) ? null : pageNumberArg.longValue());
                  wrapped.add(0, output);
                } catch (Error | RuntimeException exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}
