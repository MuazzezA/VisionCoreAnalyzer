//
//  SliderOptions.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 22.04.2025.
//

enum FilterParameterKey {
    case boxBlur, gaussianBlur, motionBlur
    case brightness, saturation, contrast, expose
}

struct SliderOption {
    let key: FilterParameterKey
    let title: String
    let minValue: Float
    let maxValue: Float
    let defaultValue: Float
    let step: Float
}
