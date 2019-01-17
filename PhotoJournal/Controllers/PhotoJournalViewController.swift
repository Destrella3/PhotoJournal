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
    }
    
}

extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoJournal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return UICollectionViewCell()
    }
    
    
}
