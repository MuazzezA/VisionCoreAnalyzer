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
        case .color:
            return SliderData.colorOptions
        }
    }
}

struct SliderData {
    static let blurOptions: [SliderOption] = [
        SliderOption(title: "Box Blur", minValue: 0, maxValue: 10, defaultValue: 0),
        SliderOption(title: "Disc Blur", minValue: 0, maxValue: 15, defaultValue: 0),
        SliderOption(title: "Gaussian Blur", minValue: 0, maxValue: 20, defaultValue: 0)
    ]
    
    static let colorOptions: [SliderOption] = [
        SliderOption(title: "Brightness", minValue: -1, maxValue: 1, defaultValue: 0),
        SliderOption(title: "Saturation", minValue: 0, maxValue: 2, defaultValue: 1),
        SliderOption(title: "Contrast", minValue: 0.5, maxValue: 1.5, defaultValue: 1)
    ]
}
