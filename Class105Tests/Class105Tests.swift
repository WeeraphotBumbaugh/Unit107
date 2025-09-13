
import Testing
import XCTest
@testable import Class105

@Suite("Initial tests for Book Model")
struct Class105Tests {
    
    @Test("BookModelInit")
    func bookModelInit() {
        let book1 = Book(
            title: "1984",
            author: "yes",
            description: "description",
            rating: 0,
            review: "review",
            status: ReadingStatus.finished,
            genre: Genre.classic
        )
        #expect(book1.title == "1984")
        #expect(book1.author == "yes")
    }
}

@Suite("Favorite View")
struct FavoriteViewTests {
    @Test("Filter all the favorite books from the initial book list")
    func filterBooks() {
        let books: [Book] = [
            Book(
            title: "1984",
            author: "yes",
            description: "description",
            rating: 0,
            review: "review",
            status: .planToRead,
            genre: .classic,
            isFavorite: true
        ),
             Book(
             title: "1984",
             author: "yes",
             description: "description",
             rating: 0,
             review: "review",
             status: .finished,
             genre: .fantasy,
             isFavorite: true
         )
        ]
        // Expect 2 favorite books
        #expect(filterFavoriteBooks(books: books, selectedGenre: nil, selectedStatus: nil).count == 2)
        
        // Expect 1 favorite book that's a classic and plan to read status
        #expect(filterFavoriteBooks(books: books, selectedGenre: .classic, selectedStatus: .planToRead).count == 1)
        
        // Expect 1 favorite book that's a fantasy and finished status
        #expect(filterFavoriteBooks(books: books, selectedGenre: .fantasy, selectedStatus: .finished).count == 1)


    }
}
