//
//  NetworkManager.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
class NetworkManager {
    
    public static let shared = NetworkManager()

    func callService<T: Decodable>(urlString: String, method: HTTPMethod, success: @escaping ((T) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        
        
        let url = URL(string: urlString)
        guard let urlObj = url else {
            fail(.urlFailed)
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            
            
                        DispatchQueue.main.async {
                            guard let data = data, error == nil else {
                                fail(.noData)
                                return
                            }
                      
                        
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(T.self, from: data)
                     
                                success(decodedData)

                        } catch {
                   
                                fail(.parsingFailed)
                  
                        }
                        }
            
        })
        task.resume()
    }
}





