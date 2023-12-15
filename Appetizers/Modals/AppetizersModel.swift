//
//  AppetizersModel.swift
//  Appetizers
//
//  Created by Shashank Pandey on 16/12/23.
//

import Foundation

struct AppetizersModel:Decodable, Identifiable{
    let description:String
    let calories:Int
    let protein:Int
    let carbs:Int
    let price:Double
    let imageURL:String
    let id:Int
    let name:String
    
}

struct AppetizersRespose:Decodable{
    let request:[AppetizersModel]
}

struct MockData{
    static let data = AppetizersModel(description: "My appetizers description",
                                      calories: 10,
                                      protein: 1,
                                      carbs: 1,
                                      price: 9.5,
                                      imageURL: "",
                                      id: 0001,
                                      name: "Appetizers name"
                                    )
    
    static let appetizers = [data, data]
}

/*
 "description":"This perfectly thin cut just melts in your mouth.",
 "calories":300,
 "protein":14,
 "price":8.99,
 "imageURL":"https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
 "id":1,
 "carbs":0,
 "name":"Asian Flank Steak"
 */
