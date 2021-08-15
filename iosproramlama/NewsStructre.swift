//
//  NewsStructre.swift
//  iosproramlama
//
//  Created by Yusuf Ersoy on 15.08.2021.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation


// MARK: - News
struct NewsEnvelop : Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [News]
}

// MARK: - Article
struct News : Decodable {
    let author: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let description: String?
}
