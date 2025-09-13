
import XCTest
import SwiftData
@testable import Class105

enum TestMake {
    static func container() throws -> ModelContainer {
        let cfg = ModelConfiguration(isStoredInMemoryOnly: true)
        return try ModelContainer(for: PersistentBook.self, configurations: cfg)
    }

    @discardableResult
    static func book(
        title: String = "The Test Book",
        author: String = "A. Author",
        imageData: Data? = nil,
        summary: String = "A description used in tests",
        rating: Int = 3,
        review: String = "a review",
        status: ReadingStatus = .planToRead,
        genre: Genre = .fantasy,
        isFavorite: Bool = false
    ) -> PersistentBook {
        PersistentBook(
            title: title,
            author: author,
            imageData: imageData,
            summary: summary,
            rating: rating,
            review: review,
            status: status,
            genre: genre,
            isFavorite: isFavorite
        )
    }
}
