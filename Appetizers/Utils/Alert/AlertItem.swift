//
//  AlertItem.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id: UUID = UUID()
    let title:Text
    let message:Text
    let actionButton:Alert.Button
}


struct AlertType{
    static let invalidData:AlertItem = AlertItem(title: Text("Server Error"),
                                                       message: Text("The data received from the server is invalid."),
                                                       actionButton: .default(Text("Ok")))
    static let invalidUrl:AlertItem = AlertItem(title: Text("Server Error"),
                                                    message: Text("Invalid url please contact support"),
                                                    actionButton: .default(Text("OK")))
    
    static let invalidResponse:AlertItem = AlertItem(title: Text("Server Error"),
                                                    message: Text("Invalid response from the server. If this persist please contact support"),
                                                    actionButton: .default(Text("OK")))
    
    static let unableToComplete:AlertItem = AlertItem(title: Text("Server Error"),
                                                    message: Text("Something went wrong! please try again later"),
                                                    actionButton: .default(Text("OK")))
    
    static let emptyField:AlertItem = AlertItem(title: Text("Empty fields"),
                                                    message: Text("None of the given entries can be empty. Please enter each details"),
                                                    actionButton: .default(Text("OK")))
    
    static let invalidEmail:AlertItem = AlertItem(title: Text("Invalid email"),
                                                    message: Text("The entred email is invalid. Please enter the correct email"),
                                                    actionButton: .default(Text("OK")))
    
    static let dataSaved:AlertItem = AlertItem(title: Text("Data Saved"),
                                                    message: Text("User data saved successfully"),
                                                    actionButton: .default(Text("OK")))
    
    static let invalidJson:AlertItem = AlertItem(title: Text("Invalid Data"),
                                                    message: Text("Unable to decode data. Please try and enter the data again."),
                                                    actionButton: .default(Text("OK")))
}

