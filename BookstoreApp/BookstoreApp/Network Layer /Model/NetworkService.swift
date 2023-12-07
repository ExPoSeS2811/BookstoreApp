import Foundation

class NetworkManager {
    enum NetworkManagerError: Error {
        case requestNotDefined
        case resultIsEmpty
    }
    
    private let jsonDecoder = JSONDecoder()
    
    func request<T: Decodable>(generator: URLRequest?, _ completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let request = generator else {
            DispatchQueue.main.async {
                completionHandler(.failure(NetworkManagerError.requestNotDefined))
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            let result: Result<T, Error>
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                do {
                    let decodedObject = try self.jsonDecoder.decode(T.self, from: data)
                    result = .success(decodedObject)
                } catch let decodingError as DecodingError {
                    result = .failure(decodingError)
                } catch {
                    result = .failure(error)
                }
            } else {
                result = .failure(NetworkManagerError.resultIsEmpty)
            }
            
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
        task.resume()
    }
    
    func requestImage(generator: URLRequest?, _ completionHandler: @escaping (Result<Data, Error>) -> Void) {
        guard let request = generator else {
            DispatchQueue.main.async {
                completionHandler(.failure(NetworkManagerError.requestNotDefined))
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            let result: Result<Data, Error>
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                result = .success(data)
            } else {
                result = .failure(NetworkManagerError.resultIsEmpty)
            }
            
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
        task.resume()
    }
}
