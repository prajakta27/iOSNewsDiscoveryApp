//
//  Articles.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
struct Articles: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleList]?
}

struct ArticleList: Codable {
 
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let name: String?
}
