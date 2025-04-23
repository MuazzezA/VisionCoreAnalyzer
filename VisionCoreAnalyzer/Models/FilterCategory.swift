//
//  FilterCategory.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 21.04.2025.
//

enum FilterCategory: Int {
    case blur = 1
    case color = 2
    
    var title: String {
        switch self {
        case .blur: return "Blur Effect"
        case .color: return "Color Effect"
        }
    }
    // extension ile slider verileri bağlandı
}

