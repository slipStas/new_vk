//
//  FriendsViewController.swift
//  lesson_1
//
//  Created by Stanislav on 22.03.2024.
//

import UIKit

class FriendsViewController: UIViewController {
    
    let array = ["first", "second", "third", "fourth", "_first", "_second", "_third", "_fourth", "1_first", "1_second", "1_third", "1_fourth", "2_first", "2_second", "2_third", "2_fourth", "3_first", "3_second", "3_third", "3_fourth", "4_first", "4_second", "4_third", "4_fourth"]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: "FriendsListCellIdentifier")
        
    }
    
    @objc private func buttonPressed(sender: UIButton) {
        print("button pressed")
        let testVC = FriendsPhotosViewController()
        self.navigationController?.pushViewController(testVC, animated: true)
    }

}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendPhotosVC = FriendsPhotosViewController()
        friendPhotosVC.setupFriend(name: array[indexPath.row])
        
        navigationController?.pushViewController(friendPhotosVC, animated: true)
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCellIdentifier", for: indexPath) as! FriendsListTableViewCell
        cell.friendNameLabel.text = array[indexPath.row]
        cell.setViews()
        
        return cell
    }
    
    
}
