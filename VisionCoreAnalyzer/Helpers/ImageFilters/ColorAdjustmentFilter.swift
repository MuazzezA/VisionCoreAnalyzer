//
//  ColorAdjustmentFilter.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 24.04.2025.
//

import UIKit
import CoreImage

enum ColorAdjustmentFilter {
    static func colorControls(_ ciImage: CIImage, brightness: Double, contrast: Double, saturation: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(brightness, forKey: kCIInputBrightnessKey)
        filter?.setValue(contrast, forKey: kCIInputContrastKey)
        filter?.setValue(saturation, forKey: kCIInputSaturationKey)
        
        return filter?.outputImage
    }
    
    static func exposureAdjust(_ ciImage: CIImage, exposeEV: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIExposureAdjust")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(exposeEV, forKey: kCIInputEVKey)
        
        return filter?.outputImage
    }
}
