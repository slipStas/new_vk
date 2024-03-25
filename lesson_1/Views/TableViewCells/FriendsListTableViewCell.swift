//
//  FriendsListTableViewCell.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
//    private lazy var friendNameLabel = UILabel()
    private lazy var friendView: FriendView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        let nameLabel = UILabel()
        nameLabel.text = "no name"
        let friendView = FriendView(photoView: imageView,
                                    nameLabel: nameLabel)
                                    
        return friendView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendView.setupForReuse()
    }
    
    func setViews() {
        self.addSubview(friendView)
        
        friendView.translatesAutoresizingMaskIntoConstraints = false
        friendView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        friendView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -50).isActive = true
        friendView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        friendView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    func setFriend(_ friend: Friend) {
        self.friendView.setup(friend: friend)
        self.friendView.setupViews()
    }

}
