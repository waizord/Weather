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
    
    var fullTimeArray = [Hourly]()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(from weatherData: WeatherData, fullTimeArray: [Hourly], for index: Int) {
        //self.fullTimeArray = fullTimeArray
        
        let sunriseFirst = weatherData.daily[0].sunrise
        let sunriseSecond = weatherData.daily[1].sunrise
        let sunsetFirst = weatherData.daily[0].sunset
        let sunsetSecond = weatherData.daily[1].sunset
        
        let time = fullTimeArray[index]
        
        if sunriseFirst == time.dt || sunriseSecond == time.dt {
            timeLabel.text = "\(getTime(from: time.dt, and: weatherData.timezone_offset))"
            imageView.image = UIImage(named: "sunrise")
            tempLabel.text = "Восход солнца"
        }else {
            if sunsetFirst == time.dt || sunsetSecond == time.dt {
                timeLabel.text = "\(getTime(from: time.dt, and: weatherData.timezone_offset))"
                imageView.image = UIImage(named: "sunset")
                tempLabel.text = "Заход солнца"
            } else {
                timeLabel.text = "\(getTime(from: time.dt, and: weatherData.timezone_offset))"
                imageView.image = UIImage(named: "\(time.weather[0].icon)")
                tempLabel.text = "\(Int(time.temp))" + "°"
            }
        }
        
        if index == 0 {
            timeLabel.text = "сейчас"
        }
//        }else {
//            timeLabel.text = "\(getTime(from: weatherData.hourly[index].dt, and: weatherData.timezone_offset))"
//        }
    }
    
    func getFullTimeArray(from hours: [Hourly], daily: [Daily]) {
        fullTimeArray.removeAll()
        
        let sunriseFirst = daily[0].sunrise
        let sunriseSecond = daily[1].sunrise
        let sunsetFirst = daily[0].sunset
        let sunsetSecond = daily[1].sunset
        
        var someSunrise = Hourly()
        var someSunset = Hourly()
        
        var index = 0
        
        for hour in hours {
            fullTimeArray.append(hour)
        }
        print(fullTimeArray.count)
        let times = fullTimeArray
        
        for time in times {
            let nextTime = time.dt + 3600
            
            if sunriseFirst > time.dt && sunriseFirst < nextTime {
                someSunrise.dt = sunriseFirst
                
                fullTimeArray.insert(someSunrise, at: index)
                index = index + 1
            }else{
                if sunsetFirst > time.dt && sunsetFirst < nextTime {
                    someSunset.dt = sunsetFirst
                    fullTimeArray.insert(someSunset, at: index)
                    index = index + 1
                }else{
                    if sunriseSecond > time.dt && sunriseSecond < nextTime {
                        someSunrise.dt = sunriseSecond
                        fullTimeArray.insert(someSunrise, at: index)
                        index = index + 1
                    }else{
                        if sunsetSecond > time.dt && sunsetSecond < nextTime {
                            someSunset.dt = sunsetSecond
                            fullTimeArray.insert(someSunset, at: index)
                            index = index + 1
                        }else{
                            index = index + 1
                            
                        }
                    }
                }
            }
        }
        print(fullTimeArray.count)
    }
}

//MARK: - Get curent date and dateformat
extension HourlyCollectionViewCell {
    func getTime(from timeinterval: Double, and timezoneOffset: Int) -> String {
        let date = Date(timeIntervalSince1970: timeinterval)
        let timeZone = TimeZone(secondsFromGMT: timezoneOffset)
        let dateFormater = DateFormatter()
        dateFormater.timeZone = timeZone
        dateFormater.dateFormat = "h:mm a"
        let time = dateFormater.string(from: date)
        return time
    }
}
