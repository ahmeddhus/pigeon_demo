import Foundation


class MoviesApi{
    static func getMovieData(apiKey: String, completion: @escaping (Result<Any?, Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown Error", code: 0, userInfo: nil)))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
