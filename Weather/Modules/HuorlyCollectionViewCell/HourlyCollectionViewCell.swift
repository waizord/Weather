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
    
    func configure(from weatherData: WeatherData, for index: Int) {

        let sunriseFirst = weatherData.daily[0].sunrise
        let sunriseSecond = weatherData.daily[1].sunrise
        let sunriseThird = weatherData.daily[2].sunrise
        let sunsetFirst = weatherData.daily[0].sunset
        let sunsetSecond = weatherData.daily[1].sunset
        let sunsetThird = weatherData.daily[2].sunset
        
        let time = weatherData.hourly[index].dt
        let nextTime = time + 3600
        
        if (sunriseFirst > time && sunriseFirst < nextTime) ||
            (sunriseSecond > time && sunriseSecond < nextTime) ||
            (sunriseThird > time && sunriseThird < nextTime) {
            imageView.image = UIImage(named: "sunrise")
            tempLabel.text = "Восход солнца"
        }else {
            if (sunsetFirst > time && sunsetFirst < nextTime) ||
                (sunsetSecond > time && sunsetSecond < nextTime) ||
                (sunsetThird > time && sunsetThird < nextTime) {
                imageView.image = UIImage(named: "sunset")
                tempLabel.text = "Заход солнца"
            } else {
                imageView.image = UIImage(named: "\(weatherData.hourly[index].weather[0].icon)")
                tempLabel.text = "\(Int(weatherData.hourly[index].temp))" + "°"
            }
        }
        
        if index == 0 {
            timeLabel.text = "сейчас"
        }else {
            timeLabel.text = "\(getTime(from: weatherData.hourly[index].dt, and: weatherData.timezone_offset))"
        }
    }
}

//MARK: - Get curent date and dateformat
extension HourlyCollectionViewCell {
    func getTime(from timeinterval: Double, and timezoneOffset: Int) -> String {
        let date = Date(timeIntervalSince1970: timeinterval)
        let timeZone = TimeZone(secondsFromGMT: timezoneOffset)
        let dateFormater = DateFormatter()
        dateFormater.timeZone = timeZone
        dateFormater.dateFormat = "h a"
        let time = dateFormater.string(from: date)
        return time
    }
}
