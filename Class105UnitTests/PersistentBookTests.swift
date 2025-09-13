
import XCTest
import SwiftData
@testable import Class105

final class PersistentBookTests: XCTestCase {

    func test_init_setsAllFields() {
        let img = Data([0xDE, 0xAD, 0xBE, 0xEF])

        let book = TestMake.book(
            title: "Init Check",
            author: "Jane Dev",
            imageData: img,
            summary: "Init summary",
            rating: 5,
            review: "Great book!",
            status: .finished,
            genre: .fantasy,
            isFavorite: true
        )

        XCTAssertEqual(book.title, "Init Check")
        XCTAssertEqual(book.author, "Jane Dev")
        XCTAssertEqual(book.summary, "Init summary")
        XCTAssertEqual(book.rating, 5)
        XCTAssertEqual(book.review, "Great book!")
        XCTAssertEqual(book.status, .finished)
        XCTAssertEqual(book.genre, .fantasy)
        XCTAssertTrue(book.isFavorite)
        XCTAssertEqual(book.imageData, img)
    }

    func test_persist_insert_and_fetch_by_title() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let book = TestMake.book(
            title: "Persist Me",
            author: "Auth",
            imageData: nil,
            summary: "Summary for persistence",
            rating: 3,
            review: "ok",
            status: .planToRead,
            genre: .scifi,
            isFavorite: false
        )

        ctx.insert(book)
        try ctx.save()

        var desc = FetchDescriptor<PersistentBook>(
            predicate: #Predicate { $0.title == "Persist Me" }
        )
        desc.fetchLimit = 1

        let fetched = try XCTUnwrap(try ctx.fetch(desc).first, "Book should round-trip into store")
        XCTAssertEqual(fetched.title, "Persist Me")
        XCTAssertEqual(fetched.author, "Auth")
        XCTAssertEqual(fetched.summary, "Summary for persistence")
        XCTAssertEqual(fetched.rating, 3)
        XCTAssertEqual(fetched.review, "ok")
        XCTAssertEqual(fetched.status, .planToRead)
        XCTAssertEqual(fetched.genre, .scifi)
        XCTAssertFalse(fetched.isFavorite)
        XCTAssertNil(fetched.imageData)
    }

    func test_update_mutates_and_persists() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let book = TestMake.book(
            title: "Before",
            author: "Old",
            summary: "Old summary",
            rating: 2,
            review: "Old review",
            status: .planToRead,
            genre: .classic,
            isFavorite: false
        )

        ctx.insert(book)
        try ctx.save()

        book.title = "After"
        book.author = "New"
        book.summary = "Updated summary"
        book.rating = 4
        book.review = "Updated review"
        book.status = .reading
        book.genre = .horror
        book.isFavorite = true
        book.imageData = Data([0xAA, 0xBB, 0xCC])

        try ctx.save()

        var desc = FetchDescriptor<PersistentBook>(
            predicate: #Predicate { $0.title == "After" }
        )
        desc.fetchLimit = 1
        let fetched = try XCTUnwrap(try ctx.fetch(desc).first)

        XCTAssertEqual(fetched.title, "After")
        XCTAssertEqual(fetched.author, "New")
        XCTAssertEqual(fetched.summary, "Updated summary")
        XCTAssertEqual(fetched.rating, 4)
        XCTAssertEqual(fetched.review, "Updated review")
        XCTAssertEqual(fetched.status, .reading)
        XCTAssertEqual(fetched.genre, .horror)
        XCTAssertTrue(fetched.isFavorite)
        XCTAssertEqual(fetched.imageData, Data([0xAA, 0xBB, 0xCC]))
    }
}
