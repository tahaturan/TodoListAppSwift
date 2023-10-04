//
//  Item.swift
//  TodoListApp
//
//  Created by Taha Turan on 3.10.2023.
//

import Foundation
import RealmSwift

class Item: Object {
   @Persisted var title: String = ""
   @Persisted var done: Bool = false
   @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}
