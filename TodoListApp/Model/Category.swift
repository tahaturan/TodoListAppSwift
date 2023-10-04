//
//  Category.swift
//  TodoListApp
//
//  Created by Taha Turan on 3.10.2023.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    @Persisted var items: List<Item>
}
