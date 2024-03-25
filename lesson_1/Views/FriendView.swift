//
//  FriendView.swift
//  lesson_1
//
//  Created by Stanislav on 25.03.2024.
//

import UIKit

class FriendView: UIView {
    
    private var photoView: UIImageView
    private var nameLabel: UILabel
    
    init(photoView: UIImageView, nameLabel: UILabel) {
        self.photoView = photoView
        self.nameLabel = nameLabel
        
        super.init(frame: .zero)
    }
    
    init(friend: Friend) {
        self.photoView = UIImageView()
        self.nameLabel = UILabel()
        
        self.photoView.image = friend.getAvatar().getPhoto()
        self.nameLabel.text = friend.getName()
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(photoView)
        addSubview(nameLabel)
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        photoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        photoView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        photoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        photoView.widthAnchor.constraint(equalTo: photoView.heightAnchor, multiplier: 1).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: photoView.centerYAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8).isActive = true
    }
    
    func setup(friend: Friend) {
        self.photoView = UIImageView(image: friend.getAvatar().getPhoto())
        self.nameLabel.text = friend.getName()
    }
    
    func setupForReuse() {
        self.photoView.image = nil
        self.nameLabel.text = nil
    }
    
}
