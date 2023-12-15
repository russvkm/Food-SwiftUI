//
//  APButtons.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI

struct APButtons:View{
    let title:LocalizedStringKey
    var body: some View{
        Text(title)
            .buttonBorderShape(.circle)
            .frame(width: 250, height: 50)
            .background(Color.tabcolor)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
    }
}

#Preview {
    APButtons(title:"App Button")
}

