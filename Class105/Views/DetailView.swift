
import SwiftUI
import SwiftData

struct DetailView: View {
    @Bindable var book: PersistentBook
    @State private var showingEditSheet = false
    @Environment(\.modelContext) private var modelContext

    private var bookImage: UIImage {
        if let data = book.imageData, let img = UIImage(data: data) { return img }
        return UIImage(systemName: "book") ?? UIImage()
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.white.opacity(0.1), .gray.opacity(1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    HStack(alignment: .top, spacing: 16) {
                        Image(uiImage: bookImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 100, maxHeight: 150)
                            .padding(.vertical, 10)
                            .accessibilityLabel("\(book.title) book cover")

                        VStack(alignment: .leading, spacing: 8) {
                            Text(book.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("by \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    HStack {
                        ForEach(1...5, id: \.self) { count in
                            Image(systemName: count <= book.rating ? "star.fill" : "star")
                                .font(.title2)
                        }
                        Spacer()
                        FavoriteToggle(isFavorite: $book.isFavorite)
                        .accessibilityIdentifier("favoriteButton")
                    }
                    .accessibilityLabel("\(book.rating) out of 5 stars")

                    HStack(spacing: 8) {
                        Text(book.status.rawValue)
                            .font(.caption).fontWeight(.bold).padding(8)
                            .background(Color.accentColor.opacity(0.2))
                            .clipShape(Capsule())

                        Text(book.genre.rawValue)
                            .font(.caption).fontWeight(.bold).padding(8)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(Capsule())
                    }

                    if !book.summary.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(book.summary)
                        }
                    }

                    if !book.review.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("My Review")
                                .font(.title2).fontWeight(.bold)
                            Text(book.review)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") { showingEditSheet = true }
                    .accessibilityLabel("Edit button")
                    .accessibilityHint("Click to edit this book")
            }
        }
        .sheet(isPresented: $showingEditSheet) {
            EditView(book: book, modelContext: modelContext)
        }
    }
}
