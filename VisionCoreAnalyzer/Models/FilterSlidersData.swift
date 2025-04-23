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
        SliderOption(title: "Box Blur", minValue: 0, maxValue: 10, defaultValue: 0, step: 1),
        SliderOption(title: "Disc Blur", minValue: 0, maxValue: 15, defaultValue: 0, step: 5),
        SliderOption(title: "Gaussian Blur", minValue: 0, maxValue: 20, defaultValue: 0, step: 5)
    ]
    
    static let colorOptions: [SliderOption] = [
        SliderOption(title: "Brightness", minValue: -1, maxValue: 1, defaultValue: 0, step: 0.2),
        SliderOption(title: "Saturation", minValue: 0, maxValue: 2, defaultValue: 1, step: 0.5),
        SliderOption(title: "Contrast", minValue: 0.5, maxValue: 1.5, defaultValue: 1, step: 0.1)
    ]
}
