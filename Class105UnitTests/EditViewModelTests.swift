import XCTest
import SwiftData
import UIKit
@testable import Class105

@MainActor
final class EditViewModelTests: XCTestCase {

    func test_isSaveDisabled_toggles_withTitleOnlyRequired() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let vm = EditViewModel(book: nil, modelContext: ctx)

        XCTAssertTrue(vm.isSaveDisabled)

        vm.title = "New Title"
        XCTAssertFalse(vm.isSaveDisabled)

        vm.title = "   "
        XCTAssertTrue(vm.isSaveDisabled)

        vm.author = "Some Author"
        XCTAssertTrue(vm.isSaveDisabled)

        vm.title = "Back Again"
        XCTAssertFalse(vm.isSaveDisabled)
    }

    func test_save_updates_existing_without_creating_duplicate_and_preservesID() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let existing = PersistentBook(
            title: "Old",
            author: "A",
            imageData: nil,
            summary: "S",
            rating: 2,
            review: "R",
            status: .planToRead,
            genre: .classic,
            isFavorite: false
        )
        ctx.insert(existing)
        try ctx.save()

        let originalID = existing.persistentModelID

        let vm = EditViewModel(book: existing, modelContext: ctx)
        vm.title = "Updated Title"
        vm.author = "Updated Author"
        vm.save()

        let all = try ctx.fetch(FetchDescriptor<PersistentBook>())
        XCTAssertEqual(all.count, 1)

        let fetched = try XCTUnwrap(all.first)
        XCTAssertEqual(fetched.persistentModelID, originalID)
        XCTAssertEqual(fetched.title, "Updated Title")
        XCTAssertEqual(fetched.author, "Updated Author")
    }

    func test_save_trims_whitespace_on_title_and_author() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let vm = EditViewModel(book: nil, modelContext: ctx)
        vm.title  = "   Spaced   "
        vm.author = "  Author  "
        vm.summary = "New summary"
        vm.rating = 3
        vm.review = "r"
        vm.status = .reading
        vm.genre = .horror
        vm.isFavorite = false

        vm.save()

        let books = try ctx.fetch(FetchDescriptor<PersistentBook>())
        XCTAssertEqual(books.count, 1)
        XCTAssertEqual(books.first?.title, "Spaced")
        XCTAssertEqual(books.first?.author, "Author")
    }


    private func makeTestImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1))
        return renderer.image { ctx in
            UIColor.red.setFill()
            ctx.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }
    }

    func test_viewModel_initializes_from_book() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let ui = makeTestImage()
        let imgData = ui.pngData()

        let book = PersistentBook(
            title: "Seed",
            author: "Orig",
            imageData: imgData,
            summary: "Seed summary",
            rating: 1,
            review: "Seed review",
            status: .planToRead,
            genre: .classic,
            isFavorite: false
        )
        ctx.insert(book)
        try ctx.save()

        let vm = EditViewModel(book: book, modelContext: ctx)

        let title   = vm.title
        let author  = vm.author
        let summary = vm.summary
        let rating  = vm.rating
        let review  = vm.review
        let status  = vm.status
        let genre   = vm.genre
        let fav     = vm.isFavorite
        let image   = vm.imageData

        XCTAssertEqual(title, "Seed")
        XCTAssertEqual(author, "Orig")
        XCTAssertEqual(summary, "Seed summary")
        XCTAssertEqual(rating, 1)
        XCTAssertEqual(review, "Seed review")
        XCTAssertEqual(status, .planToRead)
        XCTAssertEqual(genre, .classic)
        XCTAssertFalse(fav)
        XCTAssertNotNil(image)
        XCTAssertGreaterThan(image!.size.width, 0)
    }

    func test_viewModel_updates_apply_back_on_save_for_existing_book() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let original = PersistentBook(
            title: "Before VM",
            author: "Old",
            imageData: nil,
            summary: "Old summary",
            rating: 2,
            review: "Old review",
            status: .planToRead,
            genre: .classic,
            isFavorite: false
        )
        ctx.insert(original)
        try ctx.save()

        let vm = EditViewModel(book: original, modelContext: ctx)
        vm.title = "After VM"
        vm.author = "New Author"
        vm.summary = "Changed by VM"
        vm.rating = 5
        vm.review = "New review"
        vm.status = .finished
        vm.genre = .scifi
        vm.isFavorite = true
        vm.imageData = makeTestImage()

        vm.save() 

        var fd = FetchDescriptor<PersistentBook>(predicate: #Predicate { $0.title == "After VM" })
        fd.fetchLimit = 1
        let fetched = try XCTUnwrap(try ctx.fetch(fd).first)

        XCTAssertEqual(fetched.title, "After VM")
        XCTAssertEqual(fetched.author, "New Author")
        XCTAssertEqual(fetched.summary, "Changed by VM")
        XCTAssertEqual(fetched.rating, 5)
        XCTAssertEqual(fetched.review, "New review")
        XCTAssertEqual(fetched.status, .finished)
        XCTAssertEqual(fetched.genre, .scifi)
        XCTAssertTrue(fetched.isFavorite)
        XCTAssertNotNil(fetched.imageData)
        XCTAssertGreaterThan(fetched.imageData!.count, 0)
    }

    func test_viewModel_creates_new_book_when_book_is_nil() throws {
        let container = try TestMake.container()
        let ctx = ModelContext(container)

        let vm = EditViewModel(book: nil, modelContext: ctx)
        vm.title = "Brand New"
        vm.author = "Fresh"
        vm.summary = "New summary"
        vm.rating = 4
        vm.review = "New review"
        vm.status = .reading
        vm.genre = .horror
        vm.isFavorite = true
        vm.imageData = makeTestImage()

        vm.save()

        var fd = FetchDescriptor<PersistentBook>(predicate: #Predicate { $0.title == "Brand New" })
        fd.fetchLimit = 1
        let fetched = try XCTUnwrap(try ctx.fetch(fd).first)

        XCTAssertEqual(fetched.title, "Brand New")
        XCTAssertEqual(fetched.author, "Fresh")
        XCTAssertEqual(fetched.summary, "New summary")
        XCTAssertEqual(fetched.rating, 4)
        XCTAssertEqual(fetched.review, "New review")
        XCTAssertEqual(fetched.status, .reading)
        XCTAssertEqual(fetched.genre, .horror)
        XCTAssertTrue(fetched.isFavorite)
        XCTAssertNotNil(fetched.imageData)
    }
}
