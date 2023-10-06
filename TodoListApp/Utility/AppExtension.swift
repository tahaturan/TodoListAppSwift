//
//  AppExtension.swift
//  TodoListApp
//
//  Created by Taha Turan on 6.10.2023.
//

import Foundation
import UIKit
extension SwipeTableViewController {
    ///Adds a gradient layer to a view. // Görünüme bir gradient katmanı ekler.
    ///
    /// - Parameters:
    ///   - view: The view to which the gradient layer will be added. // Gradient katmanının ekleneceği görünüm.
    ///   - colors: The list of colors to be used in the gradient. // Gradientte kullanılacak renklerin listesi.
    ///   - locations: The distribution of colors in the gradient. // Gradientin renklerinin dağılımı.
    func addGradientLayer(colors: [UIColor] = K.Colors.colorgradiendList, locations: [NSNumber] = K.Colors.colorGradiendLocations) -> CALayer{
        let gradient = CAGradientLayer()
        gradient.locations = locations
        
        // Gradient renklerini belirlemek için UIColor dizisini CGColor dizisine dönüştürür.
        // This line converts the UIColor array to a CGColor array to specify gradient colors.
        gradient.colors = colors.map { $0.cgColor }

        
        return gradient
    }
    
}
