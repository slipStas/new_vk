//
//  Photo.swift
//  lesson_1
//
//  Created by Stanislav on 24.03.2024.
//

import UIKit

class Photo {
    
    enum LikeError: Error {
        case addLikeError
        case removeLikeError
    }
    
    //MARK: properties
    private var image: UIImage
    private var likesCount: Int
    private var isLiked: Bool
    private var id: Int
    
    private static var id: Int = 0
    
    //MARK: init
    init(image: UIImage, likesCount: Int, isLiked: Bool) {
        self.id = Photo.id
        self.image = image
        self.likesCount = likesCount
        self.isLiked = isLiked
        
        Photo.id += 1
    }
    
    //MARK: methods
    func getId() -> Int {
        self.id
    }
    
    func getPhoto() -> UIImage {
        self.image
    }
    
    func getLikesCount() -> Int {
        self.likesCount
    }
    
    func getIsLikedStatus() -> Bool {
        self.isLiked
    }
    
    func replace(photo: UIImage) {
        image = photo
    }
    
    func addLike(completion: (Int, Bool) -> ()) throws {
        guard likesCount < Int.max else {
            print("like counts before add like is: \(likesCount)")
            throw LikeError.addLikeError
        }
        
        likesCount += 1
        isLiked = true
        completion(likesCount, isLiked)
    }
    
    func removeLike(completion: (Int, Bool) -> ()) throws {
        guard likesCount > 0 else {
            print("like counts before remove like is: \(likesCount)")
            throw LikeError.removeLikeError
        }
        
        likesCount -= 1
        isLiked = false
        completion(likesCount, isLiked)
    }
}
