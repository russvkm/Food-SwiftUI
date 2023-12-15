//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Shashank Pandey on 17/12/23.
//

import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private var cache = NSCache<NSString, UIImage>()
    init(){
        
    }
    
    private let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    func getNetwowkCall(completion: @escaping (Result<[AppetizersModel], AppError>)->Void){
        guard let url = URL(string: baseUrl) else {
            completion(.failure(.invalidUrl))
            return
        }
        let call = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.unabletoComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let resData = try JSONDecoder().decode(AppetizersRespose.self, from: data)
                completion(.success(resData.request))
            }catch{completion(.failure(.invalidData))}
            
        }
        call.resume()
    }
    
    func downloadImage(fromUrlString urlString:String, completion:@escaping(UIImage?)->Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let call = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        call.resume()
    }
}

enum AppError:Error{
    case invalidUrl
    case invalidResponse
    case invalidData
    case unabletoComplete
}
