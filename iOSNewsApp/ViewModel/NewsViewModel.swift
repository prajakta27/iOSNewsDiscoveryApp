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

    /**
     for API call response callService()
     */
    
    override func callService() {
        
        ApiManager.shared.retrieveArticles { [weak self] response in
            self?.article = response.articles
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }


    /**
     handle response handleResponse()
     - Parameter response: article_List
     - Parameter success: bool_Value
     */
    private func handleResponse(response: Articles?, success: Bool) {
        if let articleLoaded = self.articleLoaded {
            articleLoaded(response?.articles, success)
        }
    }
    
    /**
      save user prefernce select()
     - Parameter country: selected country name
     */
        
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

    
