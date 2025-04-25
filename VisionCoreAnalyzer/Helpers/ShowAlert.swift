//
//  ShowToastMessage.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 26.04.2025.
//

import UIKit

func showAlertMessage(message: String, viewController: UIViewController) {
    let alert = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    viewController.present(alert, animated: true, completion: nil)
}
