//
//  LoadingProgressView.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI

struct LoadingProgressView:View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingProgressView()
}
