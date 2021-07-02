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
    
    let cellHight:CGFloat = 30
    
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
        
        let collectionHight: CGFloat = cellHight * CGFloat(weatherData.daily.count)
        contentView.heightAnchor.constraint(equalToConstant: collectionHight).isActive = true
        
        collectionView.reloadData()
    }
}
extension DailyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: cellHight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData?.daily.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCollectionViewCell.identifier, for: indexPath) as! DailyCollectionViewCell
        if let day = weatherData?.daily[indexPath.row] {
            cell.nameDay.text = getWeekday(daily: day, by: weatherData?.timezone_offset)
            cell.imageView.image = UIImage(named: day.weather[0].icon)
            cell.maxTemp.text = "\(Int(day.temp.max))"
            cell.minTemp.text = "\(Int(day.temp.min))"
        }
        return cell
    }
}
//MARK: - Date formater
extension DailyTableViewCell {
    func getWeekday(daily: Daily, by timezoneOffset: Int?) -> String {
        
        let dateFormater = DateFormatter()
        let date = Date(timeIntervalSince1970: daily.dt)
        let timezone = TimeZone(secondsFromGMT: timezoneOffset!)
        dateFormater.locale = Locale(identifier: "ru")
        dateFormater.timeZone = timezone
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: date).wordUppercased
    }
}
extension String {
    var wordUppercased: String {
        var aryOfWord = self.split(separator: " ")
        aryOfWord =  aryOfWord.map({String($0.first!).uppercased() + $0.dropFirst()})
        return aryOfWord.joined(separator: " ")
    }
}
