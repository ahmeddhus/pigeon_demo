mixin ApiResponseMocks {
  static String moviesMock = '''{
    "page": 1,
    "total_results": 10000,
    "total_pages": 500,
    "results": [
        {
            "poster_path": "/poster_path1",
            "id": 1,
            "title": "Movie 1",
            "vote_average": 10.0,
            "overview": "overview1",
            "release_date": "2020-01-01"
        },
         {
            "poster_path": "/poster_path2",
            "id": 2,
            "title": "Movie 2",
            "vote_average": 20.0,
            "overview": "overview2",
            "release_date": "2020-02-02"
        }
    ]
}''';

  static String emptyMoviesListMock = '''{
    "page": 1,
    "total_results": 10000,
    "total_pages": 500,
    "results": [

    ]
}''';

  static String errorResponseMock = '''{
    "status_code": 7,
    "status_message": "Invalid API key: You must be granted a valid key.",
    "success": false
}''';

  static String noMoviesListMock = '''{
    "page": 1,
    "total_results": 10000,
    "total_pages": 500
}''';

  static String invalidJsonMock = '''{
    "page": 1
    "total_results": 10000,
    "total_pages": 500,
}''';
}
