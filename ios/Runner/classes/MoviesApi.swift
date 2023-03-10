import Foundation


class MoviesApi{
    static func getMovieData(urlString: String, completion: @escaping (Result<String?, Error>) -> Void) {
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
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let jsonString = String(data: try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted), encoding: .utf8)
                completion(.success(jsonString))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
