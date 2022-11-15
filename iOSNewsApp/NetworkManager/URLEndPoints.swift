//
//  URLEndPoints.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation

struct NewsApiQuery {
    
    static let ApiKey = "86f654ea51584b7b8cab4e81f98d51f2"

    static func urlForQuery(country: String) -> URL? {
        var urlComponents = NewsApiQuery.baseUrlComponents

        urlComponents.path = everything

        let keyQueryItem = NewsApiQuery.keyQueryItem
        let dateQueryItem = URLQueryItem(name: "from", value: DateFormatterClass.getCurrentShortDate())
        let publishQueryItem = URLQueryItem(name: "sortBy", value: "publishedAt")
        let queryQueryItem = URLQueryItem(name: "q", value: country)

        urlComponents.queryItems = [ keyQueryItem, dateQueryItem, publishQueryItem, queryQueryItem ]

        return urlComponents.url
    }
    
}



private extension NewsApiQuery {
    
   static var everything = "/v2/everything"

    static var baseUrlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"

        return urlComponents
    }

    static var keyQueryItem: URLQueryItem {
        return URLQueryItem(name: "apiKey", value: ApiKey)
    }
}
