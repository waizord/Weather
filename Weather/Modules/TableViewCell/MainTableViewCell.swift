//
//  MainTableViewCell.swift
//  Weather
//
//  Created by Ivan on 6/22/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
