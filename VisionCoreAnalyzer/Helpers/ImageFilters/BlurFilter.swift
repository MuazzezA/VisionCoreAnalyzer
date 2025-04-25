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
    
    static func gaussianBlur(_ ciImage: CIImage, radius: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)
        
        return filter?.outputImage
    }
    
    static func motionBlur(_ ciImage: CIImage, radius: Double) -> CIImage? {
        
        let filter = CIFilter(name: "CIMotionBlur")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)
        filter?.setValue(0.1, forKey: kCIInputAngleKey) // default değeri 0.0
        
        return filter?.outputImage
    }
}
