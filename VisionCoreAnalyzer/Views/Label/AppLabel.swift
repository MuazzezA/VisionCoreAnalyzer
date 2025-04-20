//
//  AppLabel.swift
//  VisionCoreAnalyzer
//
//  Created by Muazzez Aydın on 20.04.2025.
//

import UIKit

@IBDesignable
class AppLabel: UILabel {

    enum Style: Int {
        case title = 0
        case body = 1
        case caption = 2
    }

    @IBInspectable var styleRawValue: Int = 1 {
        didSet {
            configure(style: Style(rawValue: styleRawValue) ?? .body)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configure(style: Style(rawValue: styleRawValue) ?? .body)
    }

    private func configure(style: Style) {
        self.numberOfLines = 0
        self.adjustsFontForContentSizeCategory = true

        switch style {
        case .title:
            self.font = UIFont(name: "Futura-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
        case .body:
            self.font = UIFont(name: "Futura", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
        case .caption:
            self.font = UIFont(name: "Futura-Condensed", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .light)
        }

        self.textColor = UIColor(named: "Text") ?? .label
    }
}

