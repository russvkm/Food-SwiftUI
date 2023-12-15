//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import Foundation

class AppetizersListViewModel:ObservableObject{
    @Published var requestList:[AppetizersModel] = [AppetizersModel]()
    @Published var alertItem:AlertItem?
    @Published var isLoading = false
    @Published var isShowing:Bool = false
    @Published var selectedAppetizers:AppetizersModel?
    
    init() {
        getNetworkCall()
    }
    
    private func getNetworkCall(){
        isLoading = true
        NetworkManager.shared.getNetwowkCall { response in
            DispatchQueue.main.async{
                self.isLoading = false
                switch response{
                case .success(let data):
                    DispatchQueue.main.async {
                        self.requestList = data
                        print(data)
                    }
                    break
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        self.alertItem = AlertType.invalidData
                        break
                    case .invalidUrl:
                        self.alertItem = AlertType.invalidUrl
                        break
                    case .invalidResponse:
                        self.alertItem = AlertType.invalidResponse
                        break
                    case .unabletoComplete:
                        self.alertItem = AlertType.unableToComplete
                        break
                    }
                    break
                }
            }
            
        }
    }
}
