//
//  FriendPhotosCollectionViewCell.swift
//  lesson_1
//
//  Created by Stanislav on 28.03.2024.
//

import UIKit

class FriendPhotosCollectionViewCell: UICollectionViewCell {
    private var image: PhotoView?
    
    func setup(photo: Photo) {
        image = PhotoView(photo: photo)
        
        guard let image = image else {return}
        
        addSubview(image)
        image.setupViews()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 680).isActive = true
//        image.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
}
