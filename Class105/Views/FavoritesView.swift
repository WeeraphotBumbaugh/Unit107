
import SwiftUI
import SwiftData

struct FavoritesView: View {

    @Query(sort: [SortDescriptor(\PersistentBook.title)]) private var books: [PersistentBook]

    @State private var showingFilterSheet = false
    @State private var selectedGenre: Genre?
    @State private var selectedStatus: ReadingStatus?

    @AppStorage(SETTINGS_GRID_COLUMN_NUMBERS_KEY) private var gridColumnNumber: Int = 2

    private let hPad: CGFloat = 16
    private let cellSpacing: CGFloat = 12

    private var favoriteBooks: [PersistentBook] {
        books.filter { b in
            guard b.isFavorite else { return false }
            if let g = selectedGenre, b.genre != g { return false }
            if let s = selectedStatus, b.status != s { return false }
            return true
        }
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                let columns = max(1, gridColumnNumber)
                let totalSpacing = cellSpacing * CGFloat(columns - 1)
                let availableWidth = UIScreen.main.bounds.width - (hPad * 2) - totalSpacing
                let side = floor(availableWidth / CGFloat(columns))

                if favoriteBooks.isEmpty {
                    Text("No favorite books yet!")
                        .frame(maxWidth: .infinity, minHeight: 200)
                }

                LazyVGrid(
                    columns: Array(repeating: GridItem(.fixed(side), spacing: cellSpacing, alignment: .top), count: columns),
                    spacing: cellSpacing
                ) {
                    ForEach(favoriteBooks) { book in
                        NavigationLink {
                            DetailView(book: book)
                        } label: {
                            SquareCardView(book: book)
                                .frame(width: side, height: side * 1.5)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, hPad)
                .padding(.vertical, 8)
            }
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Filter") { showingFilterSheet = true }
                        .accessibilityLabel("Filter button")
                        .accessibilityHint("Click to filter")
                }
            }
            .sheet(isPresented: $showingFilterSheet) {
                FilterView(selectedGenre: $selectedGenre, selectedStatus: $selectedStatus)
            }
        }
    }
}
public func filterFavoriteBooks(books: [Book], selectedGenre: Genre?, selectedStatus: ReadingStatus?)-> [Book] {
    return books.filter {
        $0.isFavorite
        && (
            selectedGenre == nil
            || $0.genre == selectedGenre
            )
        && (
            selectedStatus == nil
            || $0.status == selectedStatus
        )
    }
}
