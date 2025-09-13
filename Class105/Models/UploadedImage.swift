
import SwiftData
import Foundation

@Model
class UploadedImage {
    @Attribute(.externalStorage) var imageData: Data?
    
    init(imageData: Data?) {
        self.imageData = imageData
        
    }
}
