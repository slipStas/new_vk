//
//  FriendsPhotosViewController.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    private var friendNameLabel: UILabel?
    private var avatarView: PhotoView?
    private var friend: Friend?
    
    //MARK: init
    init(friend: Friend) {
        self.friend = friend
        self.friendNameLabel = UILabel()
        self.friendNameLabel?.text = friend.getName()
        self.avatarView = PhotoView(photo: friend.getAvatar())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        setupViews()
    }
    
    private func setupViews() {
        guard let friendNameLabel = friendNameLabel else {return}
        guard let avatarView = avatarView else {return}
        
        let likeView = avatarView.getLikeView()
        
        let likeTap = UITapGestureRecognizer(target: self, action: #selector(likeTap))
        likeView.addGestureRecognizer(likeTap)
        likeView.isUserInteractionEnabled = true
        
        view.addSubview(friendNameLabel)
        view.addSubview(avatarView)
        avatarView.setupViews()
        
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        friendNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        friendNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        friendNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeArea.trailingAnchor, constant: 0).isActive = true
        friendNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        avatarView.topAnchor.constraint(equalTo: friendNameLabel.bottomAnchor, constant: 8).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        avatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor, multiplier: 1).isActive = true
    }
    
    //MARK: @objc methods
    @objc func likeTap() {
        print("like tap!!!")
        guard let avatarView = self.avatarView else {return}
        
        let likeView = avatarView.getLikeView()
        let photo = avatarView.getPhoto()
        if avatarView.getPhoto().getIsLikedStatus() {
            do {
                try photo.removeLike(completion: { likeCount, isLiked in
                    self.avatarView?.setup(likeView: likeView, with: likeCount, and: isLiked)
                })
            } catch Photo.LikeError.addLikeError {
                print("add like error")
            } catch Photo.LikeError.removeLikeError {
                print("remova like error")
            } catch {
                print("some error")
            }
            
        } else {
            do {
                try photo.addLike(completion: { likeCount, isLiked in
                    self.avatarView?.setup(likeView: likeView, with: likeCount, and: isLiked)
                })
            } catch Photo.LikeError.addLikeError {
                print("add like error++")
            } catch Photo.LikeError.removeLikeError {
                print("remova like error++")
            } catch {
                print("some error++")
            }
        }
    }
}
