//
//  NetworkManager.swift
//  iosproramlama
//
//  Created by Yusuf Ersoy on 15.08.2021.
//

import Foundation
class NetworkManager{
    let imageCache = NSCache<NSString,NSData>()
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseUrlString = "http://newsapi.org/v2/"
    private let TRTopHeadLine = "top-headlines?country=tr"
    
    func getNews(completion: @escaping ([News]?)->Void){
        let urlString = "\(baseUrlString)\(TRTopHeadLine)&apiKey=\(APIkey.key)"
        guard let url = URL(string: urlString) else {
            
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil , let data = data else {
                completion(nil)
                return
            }
            let newsdata = try? JSONDecoder().decode(NewsEnvelop.self, from: data)
            newsdata == nil ? completion(nil) : completion(newsdata!.articles)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?)->Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)){
            completion(cachedImage as Data)
        }else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data  else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
