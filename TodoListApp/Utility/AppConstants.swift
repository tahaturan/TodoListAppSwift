//
//  AppConstants.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import Foundation
import UIKit

struct K {
    struct CellId {
        static let todoListItemCellId: String = "Cell"
       
    }
    
    struct UserDefaultsKey {
        static let todoListArray:String = "TodoListArray"
    }
    
    struct NavgigationId {
        static let categoryToItems: String = "goToItems"
    }
    struct Colors {
        static let darkDenimBlue: UIColor = UIColor(red: 5 / 255, green: 59 / 255, blue: 80 / 255, alpha: 1)
        static let bondi: UIColor = UIColor(red: 23 / 255, green: 107 / 255, blue: 135 / 255, alpha: 1)
        static let nileStone: UIColor = UIColor(red: 100 / 255, green: 204 / 255, blue: 197 / 255, alpha: 1)
        static let superSilver: UIColor = UIColor(red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1)
        static let colorgradiendList: [UIColor] = [darkDenimBlue, bondi, nileStone, superSilver]
        static let colorGradiendLocations: [NSNumber] = [0.3, 0.7, 0.9, 1]
    }
}
