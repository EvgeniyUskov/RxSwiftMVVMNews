//
//  Articles.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import Foundation

struct ArticleResponse: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    var title: String
    var description: String?
    
}
