
import SwiftUI

public enum ReadingStatus: String, CaseIterable, Hashable, Codable{
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
}
