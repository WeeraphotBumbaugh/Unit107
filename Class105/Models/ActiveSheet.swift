
import Foundation

enum ActiveSheet: Identifiable, CaseIterable, Hashable {
    case addBook
    case filter
    
    var id: Int { hashValue }
}
