//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer:AppetizersModel
    var body: some View {
        HStack{
            AppetizersRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(.buttonBorder)
            VStack(alignment:.leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(Color.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.data)
}
