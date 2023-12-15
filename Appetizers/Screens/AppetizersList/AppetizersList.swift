//
//  AppetizersList.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import SwiftUI

struct AppetizersList: View {
    @StateObject var viewModel = AppetizersListViewModel()
    var body: some View {
            ZStack{
                NavigationStack{
                    List(viewModel.requestList) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.selectedAppetizers = appetizer
                                viewModel.isShowing = true
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("🍟 Appetizers")
                    .disabled(viewModel.isShowing)
                }
                .blur(radius: viewModel.isShowing ? 20:0)
                if viewModel.isShowing{
                    ProductCard(appetizers: viewModel.selectedAppetizers!, isShowing: $viewModel.isShowing)
                }
                if viewModel.isLoading{
                    LoadingProgressView()
                }
                
            }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.actionButton)
        }
    }
}

#Preview {
    AppetizersList()
}
