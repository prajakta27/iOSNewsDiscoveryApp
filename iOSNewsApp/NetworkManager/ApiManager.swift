//
//  ApiManager.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
class ApiManager {
    public static let shared = ApiManager()


    let url = NewsApi.urlForQuery(country: Settings.shared.country.rawValue)
    
    var urlStr = ""
   
    func retrieveArticles(success: @escaping ((Articles) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        print("URL ---- \(String(describing: url))")
        if let strurl = url {
            let urlString = strurl.absoluteString
            urlStr = urlString
            print(type(of: urlString))  // should print "String"
        }
        else {
            // Your url is nil
        }
        
        NetworkManager.shared.callService(urlString: urlStr, method: .get) { (response: Articles) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
}
