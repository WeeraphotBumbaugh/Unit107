
import Testing
import SwiftData
import SwiftUI
@testable import Class105

@MainActor
@Suite("Swift Testing — Model & View/ViewModel")
struct SwiftTesting_ModelAndViewsTests {

    @Test("PersistentBook init sets all fields")
    func persistentBook_init_setsFields() throws {
        let img = Data([0xDE, 0xAD, 0xBE, 0xEF])
        let b = PersistentBook(
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

        #expect(b.title == "Init Check")
        #expect(b.author == "Jane Dev")
        #expect(b.summary == "Init summary")
        #expect(b.rating == 5)
        #expect(b.review == "Great book!")
        #expect(b.status == .finished)
        #expect(b.genre == .fantasy)
        #expect(b.isFavorite)
        #expect(b.imageData == img)
    }

    @Test("Save creates a new book (in-memory SwiftData)")
    func persistentBook_save_roundTrips() throws {
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let ctx = container.mainContext

        let vm = EditViewModel(book: nil, modelContext: ctx)
        vm.title = "Created by VM"
        vm.author = "Author A"
        vm.summary = "S"
        vm.rating = 3
        vm.review = "R"
        vm.status = .planToRead
        vm.genre = .classic
        vm.isFavorite = false
        vm.save()

        let all = try ctx.fetch(FetchDescriptor<PersistentBook>())
        #expect(all.count == 1)
        #expect(all.first?.title == "Created by VM")
        #expect(all.first?.author == "Author A")
    }

    @Test("isSaveDisabled toggles with title presence")
    func editVM_isSaveDisabled() throws {
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let ctx = container.mainContext

        let vm = EditViewModel(book: nil, modelContext: ctx)
        #expect(vm.isSaveDisabled)
        vm.title = "Some Title"
        #expect(vm.isSaveDisabled == false)
        vm.title = "   "
        #expect(vm.isSaveDisabled)
    }


    @Test("LinkViewPersistent stores the provided book")
    func linkViewPersistent_bindsBook() throws {
        let b = PersistentBook(
            title: "V Title",
            author: "V Author",
            imageData: nil,
            summary: "V Summary",
            rating: 4,
            review: "V Review",
            status: .reading,
            genre: .scifi,
            isFavorite: true
        )
        let view = LinkViewPersistent(book: b)
        #expect(view.book.title == "V Title")
        #expect(view.book.author == "V Author")
    }

    @Test("StarRatingView accepts the rating value")
    func starRatingView_acceptsValue() {
        let view = StarRatingView(rating: .constant(3))
        #expect(view.rating == 3) 
    }

}
