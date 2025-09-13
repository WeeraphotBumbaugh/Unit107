
import SwiftUI
import UIKit
import CryptoKit

struct BookCoverView: View {
    let data: Data?
    let accessibilityLabel: String

    @State private var uiImage: UIImage?

    var body: some View {
        Group {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {

                Image(systemName: "book")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.secondary)
                    .opacity(0.6)
            }
        }
        .accessibilityLabel(Text(accessibilityLabel))
        .task(id: data) {
            guard let data else {
                uiImage = nil
                return
            }

            let digest = SHA256.hash(data: data)
            let key = digest.compactMap { String(format: "%02x", $0) }.joined()

            if let cached = ImageCache.shared.get(key) {
                uiImage = cached
                return
            }

            let decoded = await Task.detached(priority: .userInitiated) {
                UIImage(data: data)
            }.value

            if let decoded {
                ImageCache.shared.set(decoded, for: key)
                uiImage = decoded
            } else {
                uiImage = nil
            }
        }
    }
}
