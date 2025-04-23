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
    
    let step: Float = 1 // todo: değiştir bunu
    var selectedCategory: FilterCategory?
    @IBOutlet weak var slidersStackView: UIStackView!
    @IBOutlet weak var slidersScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slidersScrollView.translatesAutoresizingMaskIntoConstraints = false
        slidersStackView.axis = .vertical
        slidersStackView.spacing = 8
        slidersStackView.alignment = .fill
        slidersStackView.distribution = .fill
        
        if let sliders = selectedCategory?.sliders {
            for (_, sliderOption) in sliders.enumerated() {
                let label = UILabel()
                label.text = sliderOption.title
                label.heightAnchor.constraint(equalToConstant: 24).isActive = true
                label.font = .systemFont(ofSize: 14)
                
                let slider = UISlider()
                slider.minimumValue = sliderOption.minValue
                slider.maximumValue = sliderOption.maxValue
                slider.value = sliderOption.defaultValue
                label.heightAnchor.constraint(equalToConstant: 40).isActive = true
                slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
                
                
                let stack = UIStackView(arrangedSubviews: [label, slider])
                stack.axis = .vertical
                stack.spacing = 16
                stack.alignment = .fill
                stack.distribution = .fill
                stack.translatesAutoresizingMaskIntoConstraints = false

                // boyut kısıtlandırması ile UIStackView içindeki dengesizlik giderildi
                stack.heightAnchor.constraint(equalToConstant: 64).isActive = true
               
                slidersStackView.addArrangedSubview(stack)
                slidersStackView.isLayoutMarginsRelativeArrangement = true
                // glitch: lefte 16 verince bozuluyor
                slidersStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)

            }
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
    
    @objc func sliderValueDidChange(_ sender: UISlider){
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
        print("Slider step value \(Int(roundedStepValue))")
    }
}
