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
    
    // поле Логин
    @IBOutlet weak var loginTextField: UITextField!
    
    // поле Пароль
    @IBOutlet weak var passwordTextField: UITextField!

    // EnterButton
    @IBOutlet weak var enterButton: UIButton!
    
    
    // MARK: - Life cycle
 
    // UI существует. Настройка начального состояния
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // определяем жест нажатия на экран
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        // Присваивание UIScrollView жеста нажатия
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    // Контроллер существует и готов отобразиться на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // подписываемся на центр уведомлений о показе/скрытии клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWasShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Контролер отображен на экране
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // отписываемся от центра уведомлений отображения клавиатуры
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    

    
    // MARK: - Functions
    // метод проверки авторизации пользователя
    @IBAction func buttonEnterPressed(_ sender: Any) {
//       checkAuthorisation()
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    // метод изменения высоты СкролВью по высоте фрейма клавиатуры из системного словаря
    @objc func keyBoardWasShow(_ notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInsent = UIEdgeInsets(top: 0, left: 0, bottom: (keyboardSize!.height + 2.0), right: 0)
        
        scrollView.contentInset = contentInsent
        scrollView.scrollIndicatorInsets = contentInsent
        scrollView.scrollRectToVisible(enterButton.frame, animated: true)
    }
    // отменяем поднятие фреймов поле закрытия клавиатуры
    @objc func keyBoardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
 
// Метод проверки пользователя №1
//    fileprivate func checkAuthorisation() {
//        let login = loginTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//
//        if !(login.isEmpty && password.isEmpty) {
//            print("Добро пожаловать!")
//        } else {
//            print("Проверьте заполнение полей")
//        }
//    }
    
// метод проверки авторизации пользователя №2
    func checkAuth() -> Bool {
        return (loginTextField.text ?? "").isEmpty && (passwordTextField.text ?? "").isEmpty
    }
    
    // задание проверки для перехода на главный экран при успешной авторизации
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "mainScreenID" && checkAuth() {
            return true
        } else {
            showAuthError()
            loginTextField.text = nil
            passwordTextField.text = nil
            return false
        }
    }
    
    // задание кнопки ошибки авторизации
    func showAuthError() {
        let alertVC = UIAlertController(title: "Ошибка!", message: "Введены некорректные идентификационные данные", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
