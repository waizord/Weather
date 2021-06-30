//
//  DailyTableViewCell.swift
//  Weather
//
//  Created by Ivan on 6/29/21.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    static let identifier = "DailyTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DailyTableViewCell", bundle: nil)
    }
    
    var weatherData: WeatherData?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(DailyCollectionViewCell.nib(), forCellWithReuseIdentifier: DailyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cinfigure(to weatherData: WeatherData) {
        self.weatherData = weatherData
        intrinsicContentSize
        collectionView.reloadData()
    }
}
extension DailyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData?.daily.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCollectionViewCell.identifier, for: indexPath) as! DailyCollectionViewCell
        cell.nameDay.text = "NameDay"
        return cell
    }
    
    
}
