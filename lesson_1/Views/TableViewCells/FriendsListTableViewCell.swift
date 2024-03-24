//
//  FriendsListTableViewCell.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    lazy var friendNameLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.addSubview(friendNameLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendNameLabel.text = nil
    }
    
    func setViews() {
        self.addSubview(friendNameLabel)
        
        
        
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        friendNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        friendNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -50).isActive = true
        friendNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        friendNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
//        friendNameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }

}
