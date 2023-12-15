//
//  AccountsViewModel.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI
final class AccountsViewModel:ObservableObject{
    @AppStorage("user") private var userData:Data?
    @Published var userModel = UserModel()
    @Published var alertItem:AlertItem?
    
    var isValidForm:Bool {
        guard !userModel.firstName.isEmpty &&
                !userModel.lastName.isEmpty &&
                !userModel.email.isEmpty else {
            alertItem = AlertType.emptyField
            return false
        }
        
        guard userModel.email.isValidEmail else {
            alertItem = AlertType.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        do{
            let data = try JSONEncoder().encode(userModel)
            userData = data
            alertItem = AlertType.dataSaved
        }catch{
            alertItem = AlertType.invalidJson
        }
    }
    
    func retriveUser(){
        guard let userData = userData else { return }
        do{
            userModel = try JSONDecoder().decode(UserModel.self, from: userData)
        }catch{
            alertItem = AlertType.invalidJson
        }
    }
}
