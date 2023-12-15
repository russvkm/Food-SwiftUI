//
//  Orders.swift
//  Appetizers
//
//  Created by Shashank Pandey on 18/12/23.
//

import SwiftUI

class Orders:ObservableObject{
    @Published var orders:[AppetizersModel] = []
    
    func add(_ appetizers:AppetizersModel){
        orders.append(appetizers)
    }
    
    func totalNumber()->Double{
        orders.reduce(0){$0 + $1.price}
    }
    
    func deleteItems(at offsets:IndexSet){
        orders.remove(atOffsets: offsets)
    }
}
