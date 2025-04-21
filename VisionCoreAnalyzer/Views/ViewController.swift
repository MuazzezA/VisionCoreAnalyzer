//
//  ViewController.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 20.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewButtons: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, button) in viewButtons.enumerated() {
            button.tag = index + 1
            button.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            button.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let tappedButton = sender.view,
              let category = FilterCategory(rawValue: tappedButton.tag) else {
            return
        }
        
        // segue ile sayfa geçişi
        let st = UIStoryboard(name:"Main",bundle: nil)
        let filterSt = st.instantiateViewController(withIdentifier: "filter") as! FilterViewController
        
        // bu veri gideceğin sayfada tanımlı olmalı
        filterSt.selectedCategory = category
        navigationController?.pushViewController(filterSt, animated: true)
    }
}
