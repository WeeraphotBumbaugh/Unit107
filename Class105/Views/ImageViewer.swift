
import SwiftUI
import SwiftData

public struct ImageViewer: View {
    @Query var allImages: [UploadedImage]
    public var body: some View {
        List {
            ForEach(allImages, id: \.id) { 
                Image(uiImage:
                        UIImage(data: ($0.imageData as Data?)!) ?? UIImage(resource: .defaultBook))
                .resizable()
                .frame(width: 100, height: 100)
            }
        }
    }
}
