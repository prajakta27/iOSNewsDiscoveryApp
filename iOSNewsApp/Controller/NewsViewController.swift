//
//  NewsViewController.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import UIKit
import FirebaseAnalytics

class NewsViewController: UIViewController {


    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var usaBtnStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    private var pullControl = UIRefreshControl()
    
    private var newsViewModel = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        callResponse()
        callButtonSetUp()

        pullControl.attributedTitle = NSAttributedString(string: Constants.REFRESH)
                pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
                if #available(iOS 10.0, *) {
                    tableView.refreshControl = pullControl
                } else {
                    tableView.addSubview(pullControl)
                }
        // Do any additional setup after loading the view.
    }

    // User prefernce checking
    func callButtonSetUp() {
        
            if UserDefaultsConfig.savedCountry == CountryEnum.us {
                countryLbl.text = Constants.USA_NEWS
                setImageViewChange(imageName: CountryEnum.us.rawValue)
                countryBtn.setTitle(Constants.CHANGE_TO_CANADA, for: .normal)
              
            
            } else {
                countryLbl.text = Constants.CANADA_NEWS
                setImageViewChange(imageName: CountryEnum.canada.rawValue)
                countryBtn.setTitle(Constants.CHANGE_TO_US, for: .normal)
            }

        
    }
    
    // call API response
    func callResponse() {
        Loader.shared.show()
        self.newsViewModel.articleLoaded = { [weak self] (_, success) in
            if success {
                Loader.shared.hide()
                self?.tableView.reloadData()
            } else {

            }
        }
    }
    
    // Actions
    @objc private func refreshListData(_ sender: Any) {
        self.pullControl.endRefreshing()
        self.newsViewModel.callService()
        // You can stop after API Call
        
    }
    
    @IBAction func changeToCanadaBtnAction(_ sender: Any) {
        
        Analytics.logEvent(FirebaseEventsLog.EVENT_COUNTRY_CHANGE_BUTTON, parameters:  [ "screenName": "news_Article_Listing_Screen",
            "event": "country_Change_Button_Click"
        ])
        
        
        Loader.shared.show()
        if countryLbl.text == Constants.USA_NEWS {
            newsViewModel.select(CountryEnum.canada)
            countryLbl.text = Constants.CANADA_NEWS
            setImageViewChange(imageName: CountryEnum.canada.rawValue)
            countryBtn.setTitle(Constants.CHANGE_TO_US, for: .normal)
           
        } else {

            newsViewModel.select(CountryEnum.us)
            countryLbl.text = Constants.USA_NEWS
            setImageViewChange(imageName: CountryEnum.us.rawValue)
            countryBtn.setTitle(Constants.CHANGE_TO_CANADA, for: .normal)
        
        }
    }
    
    
    func setImageViewChange(imageName: String) {
        let yourImage: UIImage? = UIImage(named: imageName)
        countryFlagImageView.image = yourImage
    }
    
    
    private func setupUI() {
        
        tableView.estimatedRowHeight = 250
        
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
  
        Analytics.logEvent(FirebaseEventsLog.EVENT_DETAILED_PAGE_SCREEN, parameters:  [ "screenName": "news_Article_Listing_Screen",
            "event": "article_Selection_Click_Pressed"
        ])
        let articleData = self.newsViewModel.getNews(index: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newsDetailsView = storyboard.instantiateViewController(withIdentifier: "newsDetailsViewControllerId") as! NewsDetailsViewController
        newsDetailsView.articleData = articleData
        self.navigationController?.pushViewController(newsDetailsView, animated: true)
     
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
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


