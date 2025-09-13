//
//  SwiftTesting_NetworkViewModelTests.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import Testing
@testable import Class105
import Foundation

@MainActor
@Suite("Swift Testing — NetworkViewModel")
struct SwiftTesting_NetworkViewModelTests {

    struct MockNetworkService: NetworkServiceProtocol {
        func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
            completion(.success(Data("Mock Data".utf8)))
        }
    }

    @Test("fetchData updates data with mock response")
    func fetch_updatesData() async throws {
        let vm = NetworkViewModel(networkService: MockNetworkService())
        vm.fetchData()
        try await Task.sleep(nanoseconds: 50_000_000)
        #expect(vm.data == "Mock Data")
        #expect(vm.isLoading == false)
    }
}
