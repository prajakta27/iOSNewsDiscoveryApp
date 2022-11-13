//
//  NewsViewController.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import UIKit

class NewsViewController: UIViewController {

    private var newsViewModel = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsViewModel.articleLoaded = { [weak self] (_, success) in
            if success {
                print(success)
            } else {

            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
