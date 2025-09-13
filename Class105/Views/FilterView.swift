
import SwiftUI

public struct FilterView: View {
    @Binding var selectedGenre: Genre?
    @Binding var selectedStatus: ReadingStatus?
    
    public var body: some View {
        NavigationStack {
            Section(header: Text("Filter by genre")) {
                Picker("Genre", selection: $selectedGenre) {
                    Text("All").tag(nil as Genre?)
                    ForEach(Genre.allCases, id: \.self) { genre in
                        Text(genre.rawValue).tag(genre)
                    }
                }
            }
            Section(header: Text("Filter by status")) {
                Picker("Status", selection: $selectedStatus) {
                    Text("All").tag(nil as ReadingStatus?)
                    ForEach(ReadingStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
            }
        }
    } 
}
