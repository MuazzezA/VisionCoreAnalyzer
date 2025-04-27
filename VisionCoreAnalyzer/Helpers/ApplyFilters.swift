//
//  ApplyFilter.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 25.04.2025.
//

import UIKit

func applyFilters(_ ciImage: CIImage, filterType: FilterCategory, rawValues: [FilterParameterKey: Float]) -> CIImage? {
    
    switch filterType {
    case .blur:
        return applyBlurFilters(ciImage, rawValues: rawValues)
    case .colorAdjustment:
        return applyColorFilters(ciImage, rawValues: rawValues)
    }
}

func applyBlurFilters(_ ciImage: CIImage, rawValues: [FilterParameterKey: Float]) -> CIImage? {
    let boxBlur = Double(rawValues[.boxBlur] ?? 0)
    let gaussianBlur = Double(rawValues[.gaussianBlur] ?? 0)
    let motionBlur = Double(rawValues[.motionBlur] ?? 20)
    
    var outputImage = ciImage
    
    if boxBlur > 0 {
        if let result = BlurFilter.boxBlur(outputImage, radius: boxBlur) {
            outputImage = result
        }
    }
    
    if gaussianBlur > 0 {
        if let result = BlurFilter.gaussianBlur(outputImage, radius: gaussianBlur) {
            outputImage = result
        }
    }
    
    if motionBlur > 0 {
        if let result = BlurFilter.motionBlur(outputImage, radius: motionBlur) {
            outputImage = result
        }
    }
    
    return outputImage
}



func applyColorFilters(_ ciImage: CIImage, rawValues: [FilterParameterKey: Float]) -> CIImage? {
    let brightness = Double(rawValues[.brightness] ?? 0)
    let saturation = Double(rawValues[.saturation] ?? 1)
    let contrast = Double(rawValues[.contrast] ?? 1)
    let expose = Double(rawValues[.expose] ?? 1)
    let whitePointAdjust = Double(rawValues[.whitePointAdjust] ?? 0)
    
    var outputImage = ciImage
    
    outputImage = ColorAdjustmentFilter.colorControls(ciImage, brightness: brightness, contrast: contrast, saturation: saturation) ?? ciImage
    
    if expose > 0 {
        if let result = ColorAdjustmentFilter.exposureAdjust(outputImage, exposeEV: expose) {
            outputImage = result
        }
    }
    
    if whitePointAdjust > 0 {
        // normalde inputColor alacak, sliderdan hepsini çevirdik
        if let result = ColorAdjustmentFilter.whitePointAdjust(outputImage, whiteP: whitePointAdjust) {
            outputImage = result
        }
    }
    return outputImage
}

