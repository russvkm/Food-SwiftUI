//
//  UserModel.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import Foundation
struct UserModel:Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var isOnNapkins:Bool = false
    var isOnfrequentRefills:Bool = false
}
