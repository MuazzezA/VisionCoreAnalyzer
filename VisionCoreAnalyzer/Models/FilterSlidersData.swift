//
//  FilterSlidersData.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 22.04.2025.
//

import Foundation

extension FilterCategory {
    var sliders: [SliderOption] {
        switch self {
        case .blur:
            return SliderData.blurOptions
        case .colorAdjustment:
            return SliderData.colorOptions
        }
    }
}

struct SliderData {
    static let blurOptions: [SliderOption] = [
        SliderOption(key: .boxBlur , title: "Box Blur", minValue: 0, maxValue: 10, defaultValue: 0, step: 1),
        SliderOption(key: .gaussianBlur ,title: "Gaussian Blur", minValue: 0, maxValue: 15, defaultValue: 0, step: 5),
        SliderOption(key: .motionBlur , title: "Motion Blur", minValue: 0, maxValue: 40, defaultValue: 20, step: 5)
    ]
    
    static let colorOptions: [SliderOption] = [
        SliderOption(key: .brightness, title: "Brightness", minValue: -1, maxValue: 1, defaultValue: 0, step: 0.1),
        SliderOption(key: .saturation, title: "Saturation", minValue: 0, maxValue: 2, defaultValue: 1, step: 0.1),
        SliderOption(key: .contrast, title: "Contrast", minValue: 0.5, maxValue: 1.5, defaultValue: 1, step: 0.1),
        SliderOption(key: .contrast, title: "Exposure Adjust", minValue: 0.0, maxValue: 2, defaultValue: 0.50, step: 0.1),
        SliderOption(key: .whitePointAdjust, title: "White Point Adjust", minValue: 0.0, maxValue: 1, defaultValue: 0.0, step: 0.2)
    ]
    
}
