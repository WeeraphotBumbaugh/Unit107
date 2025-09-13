
import SwiftUI

struct LinkViewPersistent: View {
    let book: PersistentBook
    var body: some View {
        HStack(spacing: 12) {
            BookCoverView(data: book.imageData, accessibilityLabel: "\(book.title) cover")
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}
