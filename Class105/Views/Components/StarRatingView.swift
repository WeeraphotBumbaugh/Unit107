
import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) {star in
                Button(action: {
                    rating = star
                }) {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .font(.title2)
                }.buttonStyle(.plain)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Star rating")
        .accessibilityValue("\(rating) out of 5 stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < 5 { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
}
