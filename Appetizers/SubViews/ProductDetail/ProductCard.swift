//
//  ProductCard.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI

struct ProductCard:View {
    var appetizers:AppetizersModel
    @EnvironmentObject var orders:Orders
    @Binding var isShowing:Bool
    var body: some View {
        VStack{
            AppetizersRemoteImage(urlString: appetizers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height: 225)
            Text(appetizers.name)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Text(appetizers.description)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.bottom)
            HStack{
                ItemDesc(detailName: "Calories", detailValue: "\(appetizers.calories)")
                ItemDesc(detailName: "Carbs", detailValue: "\(appetizers.carbs)")
                ItemDesc(detailName: "Proteins", detailValue: "\(appetizers.protein)")
            }
            
            Button(action: {
                orders.add(appetizers)
                isShowing = false
            }, label: {
                APButtons(title: "$\(appetizers.price, specifier: "%.2f") - Add To Order")
            })
            
        }
        .frame(width: 300)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
        .shadow(radius: 40)
        .overlay(Button{
            isShowing = false
        }label:{
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct ItemDesc:View{
    var detailName:String
    var detailValue:String
    var body: some View{
        VStack{
            Text(detailName)
                .foregroundStyle(Color(.label))
                .font(.caption)
            Text(detailValue)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
        .padding()
    }
}


#Preview {
    ProductCard(appetizers: MockData.data, isShowing: .constant(true))
}
