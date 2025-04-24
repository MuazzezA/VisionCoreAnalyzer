//
//  BlurFilter.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 24.04.2025.
//

import UIKit
import CoreImage

enum BlurFilter {
    static func boxBlur(_ ciImage: CIImage, radius: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIBoxBlur")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)
        
        return filter?.outputImage
    }
}
