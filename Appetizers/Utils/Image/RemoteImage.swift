//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import SwiftUI

final class ImageLoader:ObservableObject{
    @Published var image:Image? = nil
    func loadImage(fromUrlSting urlString:String){
        NetworkManager.shared.downloadImage(fromUrlString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage:View {
    var image:Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizersRemoteImage:View {
    @StateObject var imageLoader = ImageLoader()
    var urlString:String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.loadImage(fromUrlSting: urlString)
            }
    }
}
