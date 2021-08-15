//
//  NewsViewModel.swift
//  iosproramlama
//
//  Created by Yusuf Ersoy on 15.08.2021.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String{
        return news.author ?? "Bilinmiyor"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String{
        return news.description ?? ""
    }
    var url: String{
        return news.url  ?? ""
    }
    var urlToImage: String {
        return news.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjk9v6uG9g5AEonjfD_kYL_yoU_H78-w93Vl_SY3USsjtHVT3PXGkEB_oIVAAzb9JiP5A&usqp=CAU"
    }
}
