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
                   avatar: Photo(image: UIImage(named: "putin_1") ?? noPhoto, likesCount: 0),
                   photosArray: [
                    Photo(image: UIImage(named: "putin_2") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "putin_3") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "putin_4") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "putin_5") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "putin_6") ?? noPhoto, likesCount: 0),
                   ]),
            Friend(name: "Jobs",
                   avatar: Photo(image: UIImage(named: "jobs_1") ?? noPhoto, likesCount: 0),
                   photosArray: [
                    Photo(image: UIImage(named: "jobs_2") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_3") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_4") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_5") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_6") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_7") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_8") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_9") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_10") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_11") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "jobs_12") ?? noPhoto, likesCount: 0),
                   ]),
            Friend(name: "Trump",
                   avatar: Photo(image: UIImage(named: "trump_1") ?? noPhoto, likesCount: 0),
                   photosArray: [
                    Photo(image: UIImage(named: "trump_2") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "trump_3") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "trump_4") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "trump_5") ?? noPhoto, likesCount: 0),
                    Photo(image: UIImage(named: "trump_6") ?? noPhoto, likesCount: 0),
                   ])
        ])
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCellIdentifier", for: indexPath) as! FriendsListTableViewCell

        cell.setFriend(friendsArray[indexPath.row])
        cell.setViews()
        
        return cell
    }
}
