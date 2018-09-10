//
//  Category.swift
//  Todoey
//
//  Created by Paul Izzett on 4/9/18.
//  Copyright © 2018 Paul Izzett. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var categoryColour: String = ""
    let items = List<Item>()
}
