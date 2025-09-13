
import SwiftUI
import SwiftData

@MainActor
class EditViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var status: ReadingStatus = .planToRead
    @Published var summary: String = ""
    @Published var rating: Int = 0
    @Published var review: String = ""
    @Published var genre: Genre = .fantasy
    @Published var imageData: UIImage? = nil
    @Published var isFavorite: Bool = false
    
    private var bookToEdit: PersistentBook?
    private let modelContext: ModelContext
    
    var navigationTitle: String {
        bookToEdit == nil ? "Add Book" : "Edit Book"
    }
    
    var isSaveDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(book: PersistentBook?, modelContext: ModelContext) {
        self.bookToEdit = book
        self.modelContext = modelContext
        
        if let book {
            title = book.title
            author = book.author
            status = book.status
            summary = book.summary
            rating = book.rating
            review = book.review
            genre = book.genre
            isFavorite = book.isFavorite
            if let coverData = book.imageData {
                imageData = UIImage(data: coverData)
            }
        }
    }
    
    func save() {
        let book = bookToEdit ?? PersistentBook(title: "", author: "", imageData: nil, summary: "")
        
        book.title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        book.author = author.trimmingCharacters(in: .whitespacesAndNewlines)
        book.status = status
        book.summary = summary
        book.rating = rating
        book.review = review
        book.genre = genre
        book.isFavorite = isFavorite
        if let coverImage = imageData {
            book.imageData = coverImage.jpegData(compressionQuality: 0.8)
        } else {
            book.imageData = nil
        }
        
        if bookToEdit == nil {
            modelContext.insert(book)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save book: \(error)")
        }
    }
}

