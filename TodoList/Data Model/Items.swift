//
//  items.swift
//  TodoList
//
//  Created by krishnaveni kulkarni on 18/06/18.
//  Copyright © 2018 krishnaveni kulkarni. All rights reserved.
//

import Foundation
//Codable is added to class to make it able to encode n decode the properties (Only the standard Datatype Properties) defined in the class
class Items:Codable {
    
    var itemData: String = ""
    var itemChecked: Bool = false
}
