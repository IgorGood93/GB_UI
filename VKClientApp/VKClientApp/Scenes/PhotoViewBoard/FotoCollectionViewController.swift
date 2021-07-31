//
//  FotoCollectionViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 29.07.2021.
//

import UIKit

class FotoCollectionViewController: UICollectionViewController {
    //    MARK: - Outlets
    //    Стек картинок
    @IBOutlet var UIStockView: UICollectionView!

    // MARK: - Properties
    //  идентификатор ячейки
    private let reuseIdentifier = "PhotoClassCollectionViewCell"
    
    // массив изображений с ключом
    private let photoSet = [PhotoInfo(name: "Гамора", image: UIImage(named: "Gam_photo_01")),
                            PhotoInfo(name: "Гамора", image: UIImage(named: "Gam_photo_02")),
                            PhotoInfo(name: "Гамора", image: UIImage(named: "Gam_photo_03")),
                            PhotoInfo(name: "Гамора", image: UIImage(named: "Gam_photo_04")),
                            PhotoInfo(name: "Грут", image: UIImage(named: "GR_photo_01")),
                            PhotoInfo(name: "Грут", image: UIImage(named: "GR_photo_02")),
                            PhotoInfo(name: "Грут", image: UIImage(named: "GR_photo_03")),
                            PhotoInfo(name: "Грут", image: UIImage(named: "GR_photo_04")),
                            PhotoInfo(name: "Доктор Стрэндж", image: UIImage(named: "DrS_photo_01")),
                            PhotoInfo(name: "Доктор Стрэндж", image: UIImage(named: "DrS_photo_02")),
                            PhotoInfo(name: "Доктор Стрэндж", image: UIImage(named: "DrS_photo_03")),
                            PhotoInfo(name: "Доктор Стрэндж", image: UIImage(named: "DrS_photo_04")),
                            PhotoInfo(name: "Дракс Разрушитель", image: UIImage(named: "DR_photo_01")),
                            PhotoInfo(name: "Дракс Разрушитель", image: UIImage(named: "DR_photo_03")),
                            PhotoInfo(name: "Дракс Разрушитель", image: UIImage(named: "DR_photo_04")),
                            PhotoInfo(name: "Железный человек", image: UIImage(named: "IM_photo_01")),
                            PhotoInfo(name: "Железный человек", image: UIImage(named: "IM_photo_02")),
                            PhotoInfo(name: "Железный человек", image: UIImage(named: "IM_photo_03")),
                            PhotoInfo(name: "Звёздный лорд", image: UIImage(named: "ZL_photo_01")),
                            PhotoInfo(name: "Звёздный лорд", image: UIImage(named: "ZL_photo_02")),
                            PhotoInfo(name: "Звёздный лорд", image: UIImage(named: "ZL_photo_03")),
                            PhotoInfo(name: "Звёздный лорд", image: UIImage(named: "ZL_photo_04")),
                            PhotoInfo(name: "Капитан Америка", image: UIImage(named: "Cap_photo_01")),
                            PhotoInfo(name: "Капитан Америка", image: UIImage(named: "Cap_photo_02")),
                            PhotoInfo(name: "Капитан Америка", image: UIImage(named: "Cap_photo_03")),
                            PhotoInfo(name: "Капитан Америка", image: UIImage(named: "Cap_photo_04")),
                            PhotoInfo(name: "Ракета", image: UIImage(named: "R_photo_01")),
                            PhotoInfo(name: "Ракета", image: UIImage(named: "R_photo_02")),
                            PhotoInfo(name: "Ракета", image: UIImage(named: "R_photo_04")),
                            PhotoInfo(name: "Соколиный Глаз", image: UIImage(named: "SG_photo_01")),
                            PhotoInfo(name: "Соколиный Глаз", image: UIImage(named: "SG_photo_02")),
                            PhotoInfo(name: "Соколиный Глаз", image: UIImage(named: "SG_photo_03")),
                            PhotoInfo(name: "Соколиный Глаз", image: UIImage(named: "SG_photo_04")),
                            PhotoInfo(name: "Тор", image: UIImage(named: "T_photo_01")),
                            PhotoInfo(name: "Тор", image: UIImage(named: "T_photo_02")),
                            PhotoInfo(name: "Тор", image: UIImage(named: "T_photo_03")),
                            PhotoInfo(name: "Тор", image: UIImage(named: "T_photo_04")),
                            PhotoInfo(name: "Халк", image: UIImage(named: "H_photo_01")),
                            PhotoInfo(name: "Халк", image: UIImage(named: "H_photo_03")),
                            PhotoInfo(name: "Халк", image: UIImage(named: "H_photo_04")),
                            PhotoInfo(name: "Человек Паук", image: UIImage(named: "CP_photo_01")),
                            PhotoInfo(name: "Человек Паук", image: UIImage(named: "CP_photo_02")),
                            PhotoInfo(name: "Человек Паук", image: UIImage(named: "CP_photo_04")),
                            PhotoInfo(name: "Человек-Муравей", image: UIImage(named: "CM_photo_01")),
                            PhotoInfo(name: "Человек-Муравей", image: UIImage(named: "CM_photo_02")),
                            PhotoInfo(name: "Человек-Муравей", image: UIImage(named: "CM_photo_03")),
                            PhotoInfo(name: "Человек-Муравей", image: UIImage(named: "CM_photo_04"))]
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Preview" {
            // определяем sender класса PhotoClassCollectionViewCell
            let cell: PhotoClassCollectionViewCell = sender as! PhotoClassCollectionViewCell
            // Получаем изображение из выбранной ячейки
            let image = cell.photoStock.image
            // передаем изображение контроллеру предпросмотра
            let Preview: PreviewViewController = segue.destination as! PreviewViewController
            Preview.curentPhoto = image
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  photoSet.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoClassCollectionViewCell else {
            fatalError("{ Message: Error in dequeue PhotoClassCollectionViewCel }")
        }
        cell.photoStock.image = photoSet[indexPath.row].image
        return cell
    }
    
    // MARK: - UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
