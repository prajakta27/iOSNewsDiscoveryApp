//
//  NewsDetailsViewController.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var publishLbl: UILabel!
    @IBOutlet weak var hrsagoLbl: UILabel!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var authorImg: UIImageView!
    
    var articleData: ArticleList?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        
        newsTitleLbl.text =  articleData?.title
        descriptionLbl.text = articleData?.description
        contentLbl.text = articleData?.content
        authorNameLbl.text = articleData?.author ?? "Unknown"
        
        if let imageUrl = URL(string: articleData?.urlToImage ?? "") {
            newsImage.sd_setImage(with: imageUrl,placeholderImage: UIImage(named: "ImagePlaceorder"))
        } else {
            newsImage.image = UIImage(named: "ImagePlaceorder")

        }
        
        hrsagoLbl.text = DateFormatterClass.timeInterval(timeAgo: articleData?.publishedAt ?? "")
        publishLbl.text = DateFormatterClass.getFormattedDate(serverTime: articleData?.publishedAt ?? "", fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "HH:mm E, d MMM y")
        
        
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
