
import Foundation
import SwiftData

public struct Book: Identifiable {
    public let id = UUID()
    public var title: String
    public var author: String
    public var imageId: PersistentIdentifier?
    public var description: String = ""
    public var rating: Int = 0
    public var review: String = ""
    public var status: ReadingStatus = .planToRead
    public var genre: Genre
    public var isFavorite: Bool = false
}

