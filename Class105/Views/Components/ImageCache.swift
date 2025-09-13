
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    func get(_ key: String) -> UIImage? { cache.object(forKey: key as NSString) }
    func set(_ image: UIImage, for key: String) { cache.setObject(image, forKey: key as NSString) }
}
