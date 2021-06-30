//
//  DailyCollectionViewCell.swift
//  Weather
//
//  Created by Ivan on 6/29/21.
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {

    static let identifier = "DailyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DailyCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var nameDay: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
