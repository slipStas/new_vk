//
//  FriendsListTableViewCell.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    lazy var friendNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: 150, height: 15))
        label.textAlignment = .left
        
        return label
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.addSubview(friendNameLabel)
    }

}
