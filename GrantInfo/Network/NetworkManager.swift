//
//  NetworkManager.swift
//  GrantInfo
//
//  Created by 탁제원 on 9/30/24.
//

import Foundation

class NetworkManager {
    
    func get(
        _ urlString: String,
        _ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
        
        guard var urlComponents: URLComponents = URLComponents(string: urlString) else {
            debugPrint("[error] Fail to create URLComponents with : %@", urlString)
            return
        }
        
        guard let url: URL = urlComponents.url else {
            debugPrint("[error] Fail to create URL")
            return
        }
            
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            print("[🌏 Networking...] request url : \(url)")
            print("[🌏 Networking...] request header : \(String(describing: request.allHTTPHeaderFields))")

            let session: URLSession = URLSession(configuration: .default)
            
            session.dataTask(with: request){ (data, response, error) in
                
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let response = response {
                    print("[🌏 Networking...] response : \(String(describing: response))")
                    print("[🌏 Networking...] data : \(String(describing: data))")
                    completion(.success((data, response)))
                }
                
            }.resume()
        
    }
}
