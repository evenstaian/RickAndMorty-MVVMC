//
//  AppColors.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 11/08/23.
//

import UIKit

extension UIColor {
    static var backgroundColor: UIColor {
        let normalColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        let darkColor = UIColor(red: 0.15, green: 0.16, blue: 0.18, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var filterBackgroundColor: UIColor {
        let normalColor = UIColor(red: 0.38, green: 0.45, blue: 0.15, alpha: 1.00)
        let darkColor = UIColor(red: 0.15, green: 0.16, blue: 0.18, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var primaryColor: UIColor {
        let normalColor = UIColor(red: 0.38, green: 0.45, blue: 0.15, alpha: 1.00)
        let darkColor = UIColor(red: 0.35, green: 0.90, blue: 0.45, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var secundaryColor: UIColor {
        let normalColor = UIColor(red: 0.70, green: 0.80, blue: 0.36, alpha: 1.00)
        let darkColor = UIColor(red: 0.35, green: 0.90, blue: 0.45, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var roundImageStrokeColor: UIColor {
        let normalColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        let darkColor = UIColor(red: 0.35, green: 0.90, blue: 0.45, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var aliveColor: UIColor {
        let normalColor = UIColor(red: 0.17, green: 0.62, blue: 0.81, alpha: 1.00)
        let darkColor = UIColor(red: 0.17, green: 0.62, blue: 0.81, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var deadColor: UIColor {
        let normalColor = UIColor(red: 0.78, green: 0.36, blue: 0.30, alpha: 1.00)
        let darkColor = UIColor(red: 0.78, green: 0.36, blue: 0.30, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    static var unknownColor: UIColor {
        let normalColor = UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.00)
        let darkColor = UIColor(red: 0.77, green: 0.76, blue: 0.76, alpha: 1.00)
        let color = choiceColorWithApparence(normalColor, darkColor)
        return color
    }
    
    private static func choiceColorWithApparence(_ normalColor: UIColor, _ darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                   darkColor : normalColor
            }
        } else {
            return normalColor
        }
    }
}
