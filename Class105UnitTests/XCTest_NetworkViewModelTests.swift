//
//  XCTest_NetworkViewModelTests.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import XCTest
@testable import Class105

final class XCTest_NetworkViewModelTests: XCTestCase {

    final class MockService: NetworkServiceProtocol {
        func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
            completion(.success(Data("Mock Data".utf8)))
        }
    }

    @MainActor
    func test_fetch_setsData() throws {
        let vm = NetworkViewModel(networkService: MockService())

        let exp = expectation(description: "vm.data updated")
        func poll() {
            if vm.data == "Mock Data" { exp.fulfill() }
            else { DispatchQueue.main.asyncAfter(deadline: .now() + 0.02, execute: poll) }
        }
        vm.fetchData()
        poll()

        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(vm.data, "Mock Data")
    }
}
