//
//  Friend.swift
//  lesson_1
//
//  Created by Stanislav on 24.03.2024.
//

import UIKit

struct Friend {
    
    private var name: String
    private var avatar: Photo
    private var photosArray: [Photo]
    private var id: Int
    
    private static var id = 0
    
    init(name: String, avatar: Photo, photosArray: [Photo]) {
        self.id = Friend.id
        self.name = name
        self.avatar = avatar
        self.photosArray = photosArray
        Friend.id += 1
    }
    
    func getId() -> Int {
        self.id
    }
    
    func getName() -> String {
        self.name
    }
    
    func getAvatar() -> Photo {
        self.avatar
    }
    
    func getPhotoArray() -> [Photo] {
        self.photosArray
    }
    
    mutating func change(name: String) {
        self.name = name
    }
    
    mutating func change(avatar: Photo) {
        self.avatar = avatar
    }
    
    mutating func add(photo: Photo) {
        photosArray.append(photo)
    }
    
    mutating func add(photos: [Photo]) {
        photosArray.append(contentsOf: photos)
    }
    
}
