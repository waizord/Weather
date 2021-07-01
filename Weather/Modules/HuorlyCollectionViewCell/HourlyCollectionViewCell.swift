//
//  HourlyCollectionViewCell.swift
//  Weather
//
//  Created by Ivan on 7/1/21.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HourlyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(to hourly: Hourly) {
        timeLabel.text = "\(hourly.dt)"
        imageView.image = UIImage(named: "\(hourly.weather[0].icon)")
        tempLabel.text = "\(Int(hourly.temp))" + "°"
    }

}
