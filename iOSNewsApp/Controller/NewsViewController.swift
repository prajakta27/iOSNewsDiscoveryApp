//
//  NewsViewController.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var newsViewModel = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.newsViewModel.articleLoaded = { [weak self] (_, success) in
            if success {
                self?.tableView.reloadData()
            } else {

            }
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.tableView.registerCell(type: NewsTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
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

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsViewModel.numberOrRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: NewsTableViewCell.self, for: indexPath) as? NewsTableViewCell, let articleData = self.newsViewModel.getNews(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setArticleData(articleData: articleData)
        return cell
    }

}


