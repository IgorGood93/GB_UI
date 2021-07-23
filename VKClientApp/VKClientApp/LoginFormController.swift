//
//  LoginFormController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 21.07.2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    
    // MARK: - Outlets
    
    // СкролВью
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Логин
    @IBOutlet weak var loginInput: UITextField!
    
    // Пароль
    @IBOutlet weak var passwordInput: UITextField!

    // EnterButton
    @IBOutlet weak var enterButton: UIButton!
    
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWasShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Functions
    
    @objc func keyBoardWasShow(_ notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInsent = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? 0, right: 0)
        
        scrollView.contentInset = contentInsent
        scrollView.scrollIndicatorInsets = contentInsent
        scrollView.scrollRectToVisible(enterButton.frame, animated: true)
    }
    
    @objc func keyBoardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
    
    
    @IBAction func userSegmented(_ sender: UISegmentedControl) {
    }
    
    @IBAction func loginVersion(_ sender: Any) {
    }
    
    @IBAction func buttonEnterPressed(_ sender: Any) {
    }
    

}
