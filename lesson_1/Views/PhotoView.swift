//
//  PhotoView.swift
//  lesson_1
//
//  Created by Stanislav on 26.03.2024.
//

import UIKit

class PhotoView: UIView {
    
    //MARK: properties
    private var photo: Photo
    private var photoView: UIImageView
    private var likeView: LikesView
    
    //MARK: init
    init(photo: Photo) {
        self.photo = photo
        self.photoView = UIImageView(image: photo.getPhoto())
        self.likeView = LikesView(likeCounts: photo.getLikesCount(), isLiked: photo.getIsLikedStatus())
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: setupViews
    func setupViews() {
        
        addSubview(photoView)
        addSubview(likeView)
        
        self.likeView.setupViews()
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        likeView.translatesAutoresizingMaskIntoConstraints = false
        
        photoView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        photoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        photoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        photoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        likeView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor, constant: 8).isActive = true
        likeView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: -8).isActive = true
    }
    
    func getLikeView() -> LikesView {
        self.likeView
    }
    
    func getPhoto() -> Photo {
        self.photo
    }
    
    func setup(likeView: LikesView, with likeCounts: Int, and isLiked: Bool) {
        
        self.likeView = likeView
        self.likeView.updateLike(likeCounts: likeCounts, isLiked: isLiked)
    }
    
    func setupForReuse() {
        self.photoView.image = nil
        self.likeView.setupForReuse()
    }
}
