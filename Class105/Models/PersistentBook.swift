
import Foundation
import SwiftData

@Model
final class PersistentBook {
    public var title: String
    public var author: String
    @Attribute(.externalStorage) var imageData: Data?

    public var summary: String
    public var rating: Int
    public var review: String
    public var status: ReadingStatus
    public var genre: Genre
    public var isFavorite: Bool

    init(
        title: String,
        author: String,
        imageData: Data? = nil,
        summary: String = "",
        rating: Int = 0,
        review: String = "",
        status: ReadingStatus = .planToRead,
        genre: Genre = .fantasy,
        isFavorite: Bool = false
    ) {
        self.title = title
        self.author = author
        self.imageData = imageData
        self.summary = summary
        self.rating = rating
        self.review = review
        self.status = status
        self.genre = genre
        self.isFavorite = isFavorite
    }
}
