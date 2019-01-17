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
    
    var photoJournal = PhotoJournalModel.getPhotoJournal()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func uploadData() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
    
}
