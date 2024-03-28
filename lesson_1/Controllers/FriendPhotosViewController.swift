//
//  FriendPhotosViewController.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendPhotosViewController: UIViewController {
    private var scrollView = UIScrollView(frame: .zero)
    private var friendNameLabel: UILabel?
    private var avatarView: PhotoView?
    private var friend: Friend?
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private let CELLID = "friendsPhotoCollectionCell"
    private let lineSpacing: CGFloat = 2
    private let itemInSection: CGFloat = 3
    
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
        
        collectionView.register(FriendPhotosCollectionViewCell.self, forCellWithReuseIdentifier: CELLID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
                
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = lineSpacing
        collectionView.collectionViewLayout = layout
        
        let likeView = avatarView.getLikeView()
        
        let likeTap = UITapGestureRecognizer(target: self, action: #selector(likeTap))
        likeView.addGestureRecognizer(likeTap)
        likeView.isUserInteractionEnabled = true
        
        scrollView.addSubview(friendNameLabel)
        scrollView.addSubview(avatarView)
        scrollView.addSubview(collectionView)
        view.addSubview(scrollView)
        print("add scrollView")
        avatarView.setupViews()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        
        friendNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        friendNameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8).isActive = true
        friendNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor, constant: 0).isActive = true
        friendNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        avatarView.topAnchor.constraint(equalTo: friendNameLabel.bottomAnchor, constant: 8).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8).isActive = true
        avatarView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8).isActive = true
        avatarView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 1, constant: -16).isActive = true
        avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor, multiplier: 1).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1).isActive = true
        
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

//MARK: extensions
extension FriendPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = ((collectionView.frame.width - lineSpacing * (itemInSection + 1)) / itemInSection)
        return CGSize(width: width, height: width)
    }
    
    override func viewWillLayoutSubviews() {
       super.viewWillLayoutSubviews()
       self.collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension FriendPhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friend = friend else {return 0}
        
        let photoArray = friend.getPhotoArray()
        
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.CELLID, for: indexPath) as! FriendPhotosCollectionViewCell
        
        guard let friend = friend else {return cell}
        
        let photoArray = friend.getPhotoArray()
        
        cell.setup(photo: photoArray[indexPath.row])
        
        return cell
    }
}
