//
//  NewsViewModel.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
class NewsViewModel: BaseViewModel {
    var articleLoaded: (([ArticleList]?, Bool) -> Void)?
    var article: [ArticleList]?

    override func callService() {
        
        ApiManager.shared.retrieveArticles { [weak self] response in
            self?.article = response.articles
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }


    private func handleResponse(response: Articles?, success: Bool) {
        if let articleLoaded = self.articleLoaded {
            articleLoaded(response?.articles, success)
        }
    }
    
    func select(_ country: CountryEnum) {
        
    
        Settings.shared.country = country
    
        callService()
    }
    

    
    func numberOrRows() -> Int {
        return self.article?.count ?? 0
    }

    func getNews(index: Int) -> ArticleList? {
        return self.article?[index]
    }

}

    
