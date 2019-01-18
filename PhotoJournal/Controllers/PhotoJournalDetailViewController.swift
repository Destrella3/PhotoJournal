//
//  PhotoJournalDetailViewController.swift
//  PhotoJournal
//
//  Created by Diego Estrella III on 1/15/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class PhotoJournalDetailViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var photoTextView: UITextView!
    @IBOutlet weak var detailPhotoImage: UIImageView!
    @IBOutlet weak var photoLibrary: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private var imagePickerViewContoller: UIImagePickerController!
    private var photoImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePickerViewController()
    }
    
    private func setupImagePickerViewController() {
        imagePickerViewContoller = UIImagePickerController()
        imagePickerViewContoller.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraButton.isEnabled = false
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let photoDescription = photoTextView.text else {return }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
        if let imagedata = detailPhotoImage.image?.jpegData(compressionQuality: 0.5) {
            
            let photoPost = PhotoJournal.init(createdAt: timestamp, imageData: imagedata, descritpion: photoDescription)
            let item = ItemModel.init(image: imagedata, description: photoDescription, createdAt: timestamp)
            
            PhotoHelperClient.addItem(item: photoPost)
            PhotoHelperClient.save()
            print(item)
            
            dismiss(animated: true, completion: nil)
        }
    }
    private func showLibrayPhoto() {
        present(imagePickerViewContoller, animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        showLibrayPhoto()
    }
    
    private func savePhotoJournal(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.5) {
            let photoJournal = PhotoJournal.init(createdAt: "", imageData: imageData, descritpion: photoTextView.text)
            PhotoHelperClient.addItem(item: photoJournal)
        }
    }
}

extension PhotoJournalDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            detailPhotoImage.image = image
            savePhotoJournal(image: image)
        } else {
            print("original image is nil")
        }
        dismiss(animated: true, completion: nil)
        
    }
}

