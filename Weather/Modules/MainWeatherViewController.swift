//
//  ViewController.swift
//  Weather
//
//  Created by Ivan on 6/16/21.
//

import UIKit

class MainWeatherViewController: UIViewController {
    var weatherDatas = [WeatherData]()
    let stringUrl = "https://api.openweathermap.org/data/2.5/weather?q=Minsk&lang=ru&units=metric&appid=bf78f267cdb48d5bae47166f91e8122f"
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = networkService.postRequest(stringUrl: stringUrl)
        
        print("Value ", value)
        // Do any additional setup after loading the view.
    }
}

extension MainWeatherViewController {
    func createUrlFromComponents() {
        
    }
}
