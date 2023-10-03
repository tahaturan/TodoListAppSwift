//
//  AppConstants.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import Foundation

struct K {
    struct CellId {
        static let todoListItemCellId: String = "ToDoItemCell"
        static let categoryCell: String = "CategoryCell"
    }
    
    struct UserDefaultsKey {
        static let todoListArray:String = "TodoListArray"
    }
    
    struct NavgigationId {
        static let categoryToItems: String = "goToItems"
    }
}
