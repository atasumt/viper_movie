//
//  NetworkManager.swift
//  viper_movie
//
//  Created by UMUT on 7.11.2025.
//
import Foundation

protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(_ endpoint: ApiEndpoint, completion: @escaping (Result<T, ApiError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    
    func fetch<T>(_ endpoint: ApiEndpoint, completion: @escaping (Result<T, ApiError>) -> Void) where T : Decodable {
        guard let url = endpoint.url else {
            completion(.failure(.invalidData))
            return
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = endpoint.networkMethod.rawValue
        req.timeoutInterval = 10
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let error = error {
                completion(.failure(.custom(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodeResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodeResponse))
            } catch {
                completion(.failure(.custom(error)))
            }
            
        }.resume()
        
        
    }
    
    
}
