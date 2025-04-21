//
//  FilterViewController.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 21.04.2025.
//

import UIKit

class FilterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var filterLabel: AppLabel!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedCategory: FilterCategory?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let category = selectedCategory {
            filterLabel.text = category.title
        }
        
    }
    
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true){
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageView.image = image
            uploadImageButton.setTitle("Change Image", for: .normal)
        } else{
            print("Upload image error")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
