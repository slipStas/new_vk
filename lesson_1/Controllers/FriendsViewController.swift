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
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    //MARK: methods
    private func fillFriendsArray() {
        guard let noPhoto = UIImage(systemName: "person.fill.questionmark") else { return }
        
        friendsArray.append(contentsOf: [
            Friend(name: "Putin",
                   avatar: Photo(image: UIImage(named: "putin_1") ?? noPhoto, likesCount: 0, isLiked: false),
                   photosArray: [
                    Photo(image: UIImage(named: "putin_2") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "putin_3") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "putin_4") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "putin_5") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "putin_6") ?? noPhoto, likesCount: 0, isLiked: false),
                   ]),
            Friend(name: "Jobs",
                   avatar: Photo(image: UIImage(named: "jobs_1") ?? noPhoto, likesCount: Int.max, isLiked: false),
                   photosArray: [
                    Photo(image: UIImage(named: "jobs_2") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_3") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_4") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_5") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_6") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_7") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_8") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_9") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_10") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_11") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "jobs_12") ?? noPhoto, likesCount: 0, isLiked: false),
                   ]),
            Friend(name: "Trump",
                   avatar: Photo(image: UIImage(named: "trump_1") ?? noPhoto, likesCount: 1, isLiked: true),
                   photosArray: [
                    Photo(image: UIImage(named: "trump_2") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "trump_3") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "trump_4") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "trump_5") ?? noPhoto, likesCount: 0, isLiked: false),
                    Photo(image: UIImage(named: "trump_6") ?? noPhoto, likesCount: 0, isLiked: false),
                   ])
        ])
    }
    
    //MARK: private methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: "FriendsListCellIdentifier")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
    }
}

//MARK: UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendPhotosVC = FriendsPhotosViewController(friend: friendsArray[indexPath.row])
        
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

        cell.setViews()
        cell.setFriend(friendsArray[indexPath.row])
        
        return cell
    }
}
