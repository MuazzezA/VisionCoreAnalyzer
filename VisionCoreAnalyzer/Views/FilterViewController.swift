//
//  FilterViewController.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 21.04.2025.
//

import UIKit

class FilterViewController: UIViewController{
    
    @IBOutlet weak var filterLabel: AppLabel!
    var selectedCategory: FilterCategory?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let category = selectedCategory {
            filterLabel.text = category.title
        }
    }
}
