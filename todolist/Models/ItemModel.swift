//
//  ItemModel.swift
//  todolist
//
//  Created by Jeremy Udo on 10/21/22.
//

import Foundation

//Immutable struct

struct ItemModel: Identifiable, Codable {
    let id: String
    var title: String
    let isCompleted: Bool
    
    // UUID is a built-in function that will create a random ID
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
