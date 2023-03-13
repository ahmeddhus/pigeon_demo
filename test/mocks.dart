mixin Mocks {
  static String moviesJsonMock = '''{
    "page": 1,
    "total_results": 10000,
    "total_pages": 500,
    "results": [
        {
            "popularity": 100.0,
            "vote_count": 100,
            "video": false,
            "poster_path": "/poster_path",
            "id": 100,
            "adult": false,
            "backdrop_path": "/backdrop_path",
            "original_language": "en",
            "original_title": "original_title",
            "genre_ids": [
                100,
                200
            ],
            "title": "Megan",
            "vote_average": 10.0,
            "overview": "overview",
            "release_date": "2020-01-01"
        }
    ]
}''';
}
