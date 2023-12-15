//
//  AppetizersOrders.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import SwiftUI

struct AppetizersOrders: View {
    @EnvironmentObject var orders:Orders
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List {
                        ForEach(orders.orders) { appetizers in
                            AppetizerListCell(appetizer: appetizers)
                        }
                        .onDelete(perform: orders.deleteItems)
                    }
                    .listStyle(.plain)
                    Button{
                        
                    }label: {
                        APButtons(title: "$\(orders.totalNumber(), specifier: "%.2f") - Place Order")
                    }
                    
                }
                .padding(.bottom, 30)
                if orders.orders.isEmpty{
                    EmptyOrder()
                }
            }
            .navigationTitle("🧾 Orders")
            
        }
    }
}

#Preview {
    AppetizersOrders()
}
