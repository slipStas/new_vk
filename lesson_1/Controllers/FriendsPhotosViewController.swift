//
//  FriendsPhotosViewController.swift
//  lesson_1
//
//  Created by Stanislav on 23.03.2024.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    //TODO: add view with photo and name
    private var friendNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 8, y: 150, width: 150, height: 15))
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(friendNameLabel)
    }
    
    func setupFriend(name: String) {
        friendNameLabel.text = name
        view.addSubview(friendNameLabel)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
