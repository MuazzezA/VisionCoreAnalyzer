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
    
    @IBOutlet weak var slidersStackView: UIStackView!
    @IBOutlet weak var slidersScrollView: UIScrollView!
    
    var selectedCategory: FilterCategory?
    var sliderValues: [String: Float] = [:]
    var originalImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterLabel.text = selectedCategory?.title
        
        slidersScrollView.translatesAutoresizingMaskIntoConstraints = false
        slidersStackView.axis = .vertical
        slidersStackView.spacing = 8
        slidersStackView.alignment = .fill
        slidersStackView.distribution = .fill
        
        if let sliders = selectedCategory?.sliders {
            for (index, sliderOption) in sliders.enumerated() {
                let label = AppLabel()
                label.text = sliderOption.title
                label.styleRawValue = 1
                // label.heightAnchor.constraint(equalToConstant: 20).isActive = true
                
                let slider = UISlider()
                slider.accessibilityLabel = sliderOption.title
                slider.tag = index
                slider.minimumValue = sliderOption.minValue
                slider.maximumValue = sliderOption.maxValue
                slider.value = sliderOption.defaultValue
                // slider.heightAnchor.constraint(equalToConstant: 38).isActive = true
                slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
                
                sliderValues[sliderOption.title] = sliderOption.defaultValue
                
                let stack = UIStackView(arrangedSubviews: [label, slider])
                stack.axis = .vertical
                stack.spacing = 8
                stack.alignment = .fill
                stack.distribution = .fill
                stack.translatesAutoresizingMaskIntoConstraints = false
                
                // boyut kısıtlandırması ile UIStackView içindeki dengesizlik giderildi
                // stack.heightAnchor.constraint(equalToConstant: 64).isActive = true
                
                slidersStackView.spacing = 24
                slidersStackView.addArrangedSubview(stack)
                slidersStackView.isLayoutMarginsRelativeArrangement = true
                
                slidersStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                
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
            originalImage = image
            uploadImageButton.setTitle("Change Image", for: .normal)
        } else{
            print("Upload image error")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider){
        if let sliderOption = selectedCategory?.sliders[sender.tag] {
            let step = sliderOption.step
            let roundedStepValue = round(sender.value / step) * step
            // x.y şeklinde alacak
            sender.value = roundedStepValue
            sliderValues[sliderOption.title] = roundedStepValue
        }
    }
    
    @IBAction func applyButtonTapped(_ sender: UIButton) {
        
        guard let originalImage = originalImage,
              let ciImage = ImageFilterHelper.convertToCIImage(originalImage) else {
            print("Görsel bulunamadı.")
            return
        }
        
        //        let brightness = Double(sliderValues["Brightness"] ?? 0)
        //        let saturation = Double(sliderValues["Saturation"] ?? 1)
        //        let contrast = Double(sliderValues["Contrast"] ?? 1)
        //
        //        if let filteredCIImage = ColorFilter.colorControls(ciImage, brightness: brightness, contrast: contrast, saturation: saturation),
        //           let filteredUIImage = ImageFilterHelper.convertToUIImage(filteredCIImage) {
        //            imageView.image = filteredUIImage
        //            print("Filtre başarıyla uygulandı.")
        //        } else {
        //            print("Filtre uygulama başarısız.")
        //        }
    }
}
