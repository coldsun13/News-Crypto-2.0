import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(urlRequest: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(urlRequest: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
