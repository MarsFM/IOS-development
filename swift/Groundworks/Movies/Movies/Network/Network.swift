//
//  Network.swift
//  Movies
//
//  Created by ilya on 15.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(String)
}

fileprivate struct BaseUrl {
    static let path = "https://api.themoviedb.org/3/movie/popular?"
    static let key = "api_key=b6e54be05a4c63752fca1400c505fb93&"
    static let other = "language=ru&region=RU&page="
}

class Network {
    
    var numberPage = 1
    
    var address: String {
        return BaseUrl.path + BaseUrl.key + BaseUrl.other + "\(numberPage)"
    }
    
    var url: URL {
        return URL(string: address)!
    }
    
    var request: URLRequest {
        return URLRequest(url: url)
    }
    
    func loadMovies(completion: @escaping (NetworkResult<Result>) -> ()) {
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(error!.localizedDescription))
                return
            }
            
            guard let data = data else {
                completion(.failure("Error load data"))
                return
            }
            
            guard let value = try? JSONDecoder().decode(Result.self, from: data) else {
                completion(.failure("Error parser"))
                return
            }
            completion(.success(value))
            
        }.resume()
        
    }
    
}
