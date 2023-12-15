//
//  AppetizersAccount.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import SwiftUI

struct AppetizersAccount: View {
    @StateObject var viewModel = AccountsViewModel()
    @FocusState var focusTextField:FocusTextField?
    enum FocusTextField{
    case fisrtName, lastName, email
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Info"){
                    TextField("First Name", text: $viewModel.userModel.firstName)
                        .focused($focusTextField, equals: .fisrtName)
                        .onSubmit { focusTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.userModel.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.userModel.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                    DatePicker("Birth Day", selection: $viewModel.userModel.birthday, displayedComponents: .date)
                    Button{
                        if viewModel.isValidForm{
                            viewModel.saveChanges()
                        }
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.userModel.isOnNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.userModel.isOnfrequentRefills)
                } header: {
                    Text("Requests")
                }
                .toggleStyle(.switch)
                .tint(.tabcolor)
                
            }
                .navigationTitle("🤣 Accounts")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss"){
                            focusTextField = nil
                        }
                    }
                }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.actionButton)
        }
        .onAppear{
            viewModel.retriveUser()
        }
        
    }
}

#Preview {
    AppetizersAccount()
}
