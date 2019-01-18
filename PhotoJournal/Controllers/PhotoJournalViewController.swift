//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Diego Estrella III on 1/14/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    
    var photoJournal = [PhotoJournal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.dataSource = self
        photoJournal = PhotoHelperClient.getPhotoJournal()
        print(photoJournal.count)
        print(DataPersistenceManager.documentsDirectory())
        print(photoJournal.count)
    }
    
    
    @IBAction func actionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "Option", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Edit", style: .destructive, handler: nil))
       alert.addAction(UIAlertAction.init(title: "Delete", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Share", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoJournal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoJournalCollectionViewCell else { return UICollectionViewCell() }
        let photoToSet = photoJournal[indexPath.row]
        cell.photoTitle.text = photoToSet.descritpion
        cell.photoDate.text = photoToSet.createdAt
        cell.photoImage.image = UIImage(data: photoToSet.imageData)
        return cell
    }
    
}
