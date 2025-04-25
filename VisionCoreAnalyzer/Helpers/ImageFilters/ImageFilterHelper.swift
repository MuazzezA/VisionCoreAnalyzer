//
//  ImageFilterHelper.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 24.04.2025.
//

import UIKit

enum ImageFilterHelper {
    
    static func convertToCIImage(_ image: UIImage) -> CIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        return ciImage
    }
    
    static func convertToUIImage(_ ciImage: CIImage) -> UIImage? {
        let context = CIContext()
        if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
    
    enum Blur {
        static let boxBlur = BlurFilter.boxBlur
    }
    
    enum ColorAdjustment {
        static let colorControls = ColorAdjustmentFilter.colorControls
    }
}
