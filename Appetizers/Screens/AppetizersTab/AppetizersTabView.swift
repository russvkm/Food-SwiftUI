//
//  AppetizersTabView.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import SwiftUI

struct AppetizersTabView:View {
    @EnvironmentObject var order:Orders
    var body: some View {
        TabView{
            AppetizersList()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AppetizersAccount()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            AppetizersOrders()
                .tabItem {
                    Label("Ordes", systemImage: "bag")
                }
                .badge(order.orders.count)
        }
        .tint(Color(.tabcolor))
    }
}

#Preview {
    AppetizersTabView()
}
