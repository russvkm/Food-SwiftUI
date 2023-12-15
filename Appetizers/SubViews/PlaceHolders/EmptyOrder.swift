//
//  EmptyOrder.swift
//  Appetizers
//
//  Created by Shashank Pandey on 18/12/23.
//

import SwiftUI

struct EmptyOrder:View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            VStack{
                Image("empty-order")
                    .resizable()
                    .frame(width:250, height: 180)
                Text("Your cart is empty. \nPlease add some items to the list")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyOrder()
}
