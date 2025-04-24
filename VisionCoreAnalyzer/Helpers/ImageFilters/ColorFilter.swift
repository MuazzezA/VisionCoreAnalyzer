//
//  ColorFilter.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 24.04.2025.
//

import UIKit
import CoreImage

enum ColorFilter {
    static func colorControls(_ ciImage: CIImage, brightness: Double, contrast: Double, saturation: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(brightness, forKey: kCIInputBrightnessKey)
        filter?.setValue(contrast, forKey: kCIInputContrastKey)
        filter?.setValue(saturation, forKey: kCIInputSaturationKey)
        
        return filter?.outputImage
    }
}
