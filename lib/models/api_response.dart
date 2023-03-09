
class ApiResponse {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final dynamic results;

  ApiResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      page: int.tryParse(json['page']),
      totalPages: int.tryParse(json['total_pages']),
      totalResults: int.tryParse(json['total_results']),
      results: json['results'],
    );
  }
}
