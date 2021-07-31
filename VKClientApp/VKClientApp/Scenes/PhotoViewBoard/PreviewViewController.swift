//
//  PreviewViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 30.07.2021.
//

import UIKit

class PreviewViewController: UIViewController {
    //    MARK: - Outlets
    //    окно предпросмотра
    @IBOutlet private weak var previewImageView: UIImageView!
    
    // передаваемое изображение
    var curentPhoto: UIImage!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.previewImageView.image = curentPhoto
    }
    


}
