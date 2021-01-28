//
//  ArticleViewModel.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articleViewModels: [ArticleViewModel]
    
    init(articles: [Article]) {
        self.articleViewModels = articles.compactMap(ArticleViewModel.init)
    }
    
    func article(at index: Int) -> ArticleViewModel {
        return articleViewModels[index]
    }
    
}

struct ArticleViewModel {
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
