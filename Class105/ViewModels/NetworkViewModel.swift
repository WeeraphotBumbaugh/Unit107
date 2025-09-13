//
//  NetworkViewModel.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import Foundation
import SwiftUI

@MainActor
final class NetworkViewModel: ObservableObject {
    @Published private(set) var data: String = ""
    @Published private(set) var isLoading = false
    private let service: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = DefaultNetworkService()) {
        self.service = networkService
    }

    func fetchData(from url: URL = URL(string: "https://example.com")!) {
        isLoading = true
        service.fetchData(url: url) { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let bytes):
                    self.data = String(decoding: bytes, as: UTF8.self)
                case .failure:
                    self.data = ""
                }
            }
        }
    }
}
