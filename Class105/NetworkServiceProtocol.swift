//
//  NetworkServiceProtocol.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

struct DefaultNetworkService: NetworkServiceProtocol {
    func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error { completion(.failure(error)); return }
            completion(.success(data ?? Data()))
        }.resume()
    }
}
