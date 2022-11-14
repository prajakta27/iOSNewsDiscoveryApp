//
//  NewsTableViewCell.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var autherLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setArticleData(articleData: ArticleList) {
        autherLbl.text = articleData.author
        titleLbl.text = articleData.title
        

        if let imageUrl = URL(string: articleData.urlToImage ?? "") {
            newsImg.sd_setImage(with: imageUrl,placeholderImage: UIImage(named: "ImagePlaceorder"))
        } else {
            newsImg.image = UIImage(named: "ImagePlaceorder")

        }
        
        timeLbl.text = DateFormatterClass.timeInterval(timeAgo: articleData.publishedAt ?? "")
        
        // Create URL
//        guard let url = URL(string: articleData.urlToImage ?? "") else { return }
//
//           // Fetch Image Data
//           if let data = try? Data(contentsOf: url) {
//               // Create Image and Update Image View
//               newsImg.image = UIImage(data: data)
//           }
        

    }
    
    
}
