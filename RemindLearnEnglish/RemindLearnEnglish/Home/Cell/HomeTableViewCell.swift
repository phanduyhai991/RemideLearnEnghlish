//
//  HomeTableViewCell.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var numberNotice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(data: HomeContentModel) {
        self.titleCell.text = data.titleContent
    }

}
