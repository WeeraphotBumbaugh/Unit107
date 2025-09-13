
import SwiftUI

struct SquareCardView: View {
    @AppStorage(SETTINGS_GRID_SHOW_AUTHOR_KEY) private var gridShowAuthor = true
    var book: PersistentBook

    private var cover: UIImage {
        if let d = book.imageData, let img = UIImage(data: d) { return img }
        return UIImage(systemName: "book") ?? UIImage()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { proxy in
                Image(uiImage: cover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
                    .overlay(Color.black.opacity(0.25))
            }

            VStack(spacing: 6) {
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))

                if gridShowAuthor {
                    Text(book.author)
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.black.opacity(0.5)))
                }

                Text(book.genre.rawValue)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Capsule().fill(Color.blue.opacity(0.7)))
                    .padding(.bottom, 6)
            }
            .padding(.horizontal, 8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(book.title) by \(book.author)")
        .accessibilityIdentifier("\(book.title) by \(book.author)")
    }
}
