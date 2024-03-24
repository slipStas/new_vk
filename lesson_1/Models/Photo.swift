//
//  Photo.swift
//  lesson_1
//
//  Created by Stanislav on 24.03.2024.
//

import UIKit

struct Photo {
    
    private enum LikeError: Error {
        case addLikeError
        case removeLikeError
    }
    
    private var image: UIImage
    private var likesCount: Int
    
    init(image: UIImage, likesCount: Int) {
        self.image = image
        self.likesCount = likesCount
    }
    
    mutating func replace(photo: UIImage) {
        image = photo
    }
    
    mutating func addLike() throws {
        guard likesCount + 1 > Int.max else {
            throw LikeError.addLikeError
        }
        
        likesCount += 1
    }
    
    mutating func removeLike() throws {
        guard likesCount - 1 >= 0 else {
            throw LikeError.removeLikeError
        }
        
        likesCount -= 1
    }
}
