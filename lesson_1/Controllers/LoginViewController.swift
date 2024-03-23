//
//  ViewController.swift
//  lesson_1
//
//  Created by Stanislav on 06.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var startVCTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var startVCLabel: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.enterButtonTap()
        
        self.hideKeyboard()
    }
    
    var loginInfo: LoginInfo?
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.loginInfo = LoginInfo()
        self.setupStartViews()
        
    }
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.orientationChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.checkLandscape()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    //MARK: @objc methods
    @objc func orientationChange() {
        switch UIDevice.current.orientation {
        case .portrait:
            print("portrait orientation \(self.view.frame.height)")
            self.startVCTopConstraint.constant = 300
        case .landscapeLeft:
            print("landscape left orientation")
            self.startVCTopConstraint.constant = 10
        case .landscapeRight:
            print("landscape right orientation")
            self.startVCTopConstraint.constant = 10
        default:
            break
        }
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    //MARK: private methods
    private func setUpVCTopConstrPortrait() {
        print("set up portrait \(self.view.window?.frame.height ?? 0) \(self.view.frame.height)")
        self.startVCTopConstraint.constant = 300
    }
    
    private func setUpVCTopConstrLandscape() {
        print("set up landscape \(self.view.window?.frame.height ?? 0) \(self.view.frame.height)")
        self.startVCTopConstraint.constant = 10
    }
    
    private func checkLandscape() {
        print("checking landscape")
        if UIDevice.current.orientation.isPortrait {
            self.setUpVCTopConstrPortrait()
        } else {
            self.setUpVCTopConstrLandscape()
        }
    }
    
    private func setupStartViews() {
        self.view.backgroundColor = UIColor.random
        self.startVCLabel.text = "Enter to your account"
        self.loginLabel.text = "Login"
        self.loginLabel.textAlignment = .left
        self.passwordLabel.text = "Password"
        self.passwordLabel.textAlignment = .left
        
        self.loginTextField.placeholder = "enter your login"
        self.passwordTextField.placeholder = "enter your password"
        self.passwordTextField.isSecureTextEntry = true
        
        self.loginButton.setTitle("Enter", for: .normal)
    }
    
    private func enterButtonTap() {
        guard let login = self.loginTextField.text else {
            self.startVCLabel.text = "Enter login!!!"
            return
        }
        guard let password = self.passwordTextField.text else {
            self.startVCLabel.text = "Enter password!!!"
            return
        }
        guard let loginInfo = self.loginInfo else { return }
        
        if loginInfo.check(login: login, and: password) {
            print("Login/password is correct")
            let tabBarVC = MainTabBarController()
            tabBarVC.modalPresentationStyle = .fullScreen
            self.present(tabBarVC, animated: true, completion: nil)
        } else {
            let errorVC = LoginErrorController()
            present(errorVC, animated: true)
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
    }
}

