//
//  LikesView.swift
//  lesson_1
//
//  Created by Stanislav on 26.03.2024.
//

import UIKit

class LikesView: UIView {

    //MARK: properties
    private var heartView: UIImageView?
    private var likesCountsView: UILabel?
    
    private var likeCounts: Int {
        didSet {
            self.likesCountsView?.text = String(likeCounts)
        }
    }
    private var isLiked: Bool {
        didSet {
            setupColorOfLike()
        }
    }
    
    //MARK: init
    init(likeCounts: Int, isLiked: Bool) {
        self.likeCounts = likeCounts
        self.isLiked = isLiked
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setCornerRadius()
    }
    
    //MARK: setupViews
    func setupViews() {
        guard let heartImage = UIImage(systemName: "heart.fill") else {return}
        
        heartView = UIImageView(image: heartImage)
        likesCountsView = UILabel()
        likesCountsView?.text = String(likeCounts)
        likesCountsView?.font = .systemFont(ofSize: 17)
        likesCountsView?.textColor = .lightGray
        
        self.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.247606189)
        
                
        guard let heartView = heartView else {return}
        guard let likesCountsView = likesCountsView else {return}
        
        addSubview(heartView)
        addSubview(likesCountsView)
        
        setupColorOfLike()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        heartView.translatesAutoresizingMaskIntoConstraints = false
        likesCountsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        heartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        heartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        heartView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        heartView.widthAnchor.constraint(equalTo: heartView.heightAnchor, multiplier: 1).isActive = true
        
        likesCountsView.leadingAnchor.constraint(equalTo: heartView.trailingAnchor, constant: 6).isActive = true
        likesCountsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        likesCountsView.bottomAnchor.constraint(equalTo: heartView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupColorOfLike() {
        guard let heartView = heartView else {return}
 
        if isLiked {
            UIView.animate(withDuration: 0.5, delay: 0) {
                heartView.tintColor = .red
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0) {
                heartView.tintColor = .lightGray
            }
        }
    }
    
    private func setCornerRadius() {
        self.layer.cornerRadius = self.frame.height / 4
        self.layer.masksToBounds = true
    }
    
    func setupForReuse() {
        heartView?.image = nil
        likesCountsView?.text = nil
    }
    
    func updateLike(likeCounts: Int, isLiked: Bool) {
        self.likeCounts = likeCounts
        self.isLiked = isLiked
    }
}
