//
//  FriendsViewController.swift
//  lesson_1
//
//  Created by Stanislav on 22.03.2024.
//

import UIKit

class FriendsViewController: UIViewController {
    
    private var friendsArray: [Friend] = []
    private let tableView = UITableView()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fillFriendsArray()
    }
    
    //MARK: methods
    private func fillFriendsArray() {
        guard let person = UIImage(systemName: "person") else { return }
        guard let personFill = UIImage(systemName: "person.fill") else { return }
        guard let personCircle = UIImage(systemName: "person.circle") else { return }
        guard let personCircleFill = UIImage(systemName: "person.circle.fill") else { return }
        guard let personSlash = UIImage(systemName: "person.slash") else { return }
        guard let personSlashFill = UIImage(systemName: "person.slash.fill") else { return }
        guard let personFillTurnRight = UIImage(systemName: "person.fill.turn.right") else { return }
        guard let personFillCheckmark = UIImage(systemName: "person.fill.checkmark") else { return }
        guard let personFillXmark = UIImage(systemName: "person.fill.xmark") else { return }
        guard let personFillQuestionmark = UIImage(systemName: "person.fill.questionmark") else { return }
        guard let personBadgePlus = UIImage(systemName: "person.badge.plus") else { return }
        
        friendsArray.append(Friend(name: "person",
                                   avatar: Photo(image: person, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personFill",
                                   avatar: Photo(image: personFill, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personCircle",
                                   avatar: Photo(image: personCircle, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personCircleFill",
                                   avatar: Photo(image: personCircleFill, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personSlash",
                                   avatar: Photo(image: personSlash, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personSlashFill",
                                   avatar: Photo(image: personSlashFill, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personFillTurnRight",
                                   avatar: Photo(image: personFillTurnRight, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personFillCheckmark",
                                   avatar: Photo(image: personFillCheckmark, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personFillXmark",
                                   avatar: Photo(image: personFillXmark, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personFillQuestionmark",
                                   avatar: Photo(image: personFillQuestionmark, likesCount: 0),
                                   photosArray: []))
        friendsArray.append(Friend(name: "personBadgePlus",
                                   avatar: Photo(image: personBadgePlus, likesCount: 0),
                                   photosArray: []))
    }
    
    //MARK: private methods
    private func setupTableView() {
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: "FriendsListCellIdentifier")
        
    }
    
    //MARK: @objc methods
    @objc private func buttonPressed(sender: UIButton) {
        print("button pressed")
        let testVC = FriendsPhotosViewController()
        self.navigationController?.pushViewController(testVC, animated: true)
    }

}

//MARK: UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendPhotosVC = FriendsPhotosViewController()
        friendPhotosVC.setupFriend(name: friendsArray[indexPath.row].getName())
        
        navigationController?.pushViewController(friendPhotosVC, animated: true)
    }
}

//MARK: UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCellIdentifier", for: indexPath) as! FriendsListTableViewCell
        cell.set(name: friendsArray[indexPath.row].getName())
        cell.setViews()
        
        return cell
    }
}
