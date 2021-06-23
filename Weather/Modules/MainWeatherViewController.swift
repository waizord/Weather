//
//  ViewController.swift
//  Weather
//
//  Created by Ivan on 6/16/21.
//

import UIKit
import CoreLocation

class MainWeatherViewController: UIViewController {
    
//    var cityNameLabel: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .black
//        label.text = "Minsk"
//        return label
//    }()
//
//    var cityDescriptionLabel: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .black
//        return label
//    }()
//
//    var cityTempLabel: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .blue
//        return label
//    }()
//
//    var scrolView: UIScrollView = {
//        var view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
//
//    var collectionView: UICollectionView = {
//        var view = UICollectionView()
//        view.backgroundColor = .green
//        return view
//    }()
//
//    var weatherTable: UITableView = {
//        var view = UITableView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .yellow
//        return view
//    }()
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    var stringUrl = ""
    var stringUrlCityName = ""
    
    let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bringLocationCoordinates()
        
        
    }
}
//MARK: - Setting location and Network request
extension MainWeatherViewController {
    func bringLocationCoordinates() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
    
    func createStringUrlBy(_ latitude: Double, and longitude: Double) {
        var urlByLocation: String = "https://api.openweathermap.org/data/2.5/onecall?"
        let language = "&lang=ru"
        let exclude = "&exclude=minutely,alerts"
        let tempInCelsius = "&units=metric"
        let apiKey = "&appid=bf78f267cdb48d5bae47166f91e8122f"
        
        urlByLocation.append("lat=\(latitude)")
        urlByLocation.append("&lon=\(longitude)")
        urlByLocation.append(exclude)
        urlByLocation.append(language)
        urlByLocation.append(tempInCelsius)
        urlByLocation.append(apiKey)
        
        self.stringUrl = urlByLocation
        print(self.stringUrl)
    }
    
    func createStringUrlForCityName(_ latitude: Double, and longitude: Double) {
        var urlOfCityName = "https://api.openweathermap.org/data/2.5/weather?"
        let language = "&lang=ru"
        let apiKey = "&appid=bf78f267cdb48d5bae47166f91e8122f"
        
        urlOfCityName.append("lat=\(latitude)")
        urlOfCityName.append("&lon=\(longitude)")
        urlOfCityName.append(language)
        urlOfCityName.append(apiKey)
        
        self.stringUrlCityName = urlOfCityName
        print(self.stringUrlCityName)
    }
    
    func getNetworkRequest() {
        networkService.networkRequest(by: self.stringUrl) {[weak self](weatherData) in
            guard let self = self else {return}
            self.weatherData = weatherData
            
            DispatchQueue.main.async {
                self.showDiscription(self.weatherData.daily[0].weather[0].description)
                self.showCurrentTemp(self.weatherData.daily[0].temp.day)
            }
        }
    }
    func getNetworkRequestOfCityName() {
        networkService.networkRequestforCityName(by: self.stringUrlCityName) { [weak self](curentData) in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.showCityName(curentData.name)
            }
        }
    }
}

//MARK: - Setting UI information
extension MainWeatherViewController {
    func showCityName(_ name: String) {
        self.cityNameLabel.text = name
        print(name)
    }
    func showDiscription(_ discription: String) {
        self.discriptionLabel.text = discription
        print(discription)
    }
    func showCurrentTemp(_ temp: Double) {
        self.tempLabel.text = "\(temp)" + "°"
        print(temp)
    }
}

extension MainWeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
            
            self.createStringUrlBy(lastLocation.coordinate.latitude, and: lastLocation.coordinate.longitude)
            self.createStringUrlForCityName(lastLocation.coordinate.latitude, and: lastLocation.coordinate.longitude)
            self.getNetworkRequest()
            self.getNetworkRequestOfCityName()
        }
    }
}
