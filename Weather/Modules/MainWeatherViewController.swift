//
//  ViewController.swift
//  Weather
//
//  Created by Ivan on 6/16/21.
//

import UIKit
import CoreLocation

class MainWeatherViewController: UIViewController {

    var weatherTableView: UITableView = {
        var table = UITableView()
        table.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    var stringUrl = ""
    var stringUrlCityName = ""
    
    let networkService = NetworkService()
    
//MARK: - life cycle of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocationCoordinates()
        
        addAllViews()
        addAllConstraints()
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
    }
}

//MARK: - TableView delegate and dataSorce
extension MainWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.subtitleLabel.text = "ВОСХОД СОЛНЦА"
        cell.subtitleLabel.adjustsFontSizeToFitWidth = true
        cell.mainLabel.text = "8:45 AM"
        return cell
    }
    
    
    
}
//MARK: - Setting location and Network request
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

extension MainWeatherViewController {
    func getLocationCoordinates() {
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
        //self.cityNameLabel.text = name
        print(name)
    }
    func showDiscription(_ discription: String) {
        //self.discriptionLabel.text = discription
        print(discription)
    }
    func showCurrentTemp(_ temp: Double) {
        //self.tempLabel.text = "\(temp)" + "°"
        print(temp)
    }
}

//MARK: - Setting constraints and show Views
extension MainWeatherViewController {
    
    func addAllViews() {
        view.addSubview(weatherTableView)
        addHeaderfoeTable()
    }
    
    func addHeaderfoeTable() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: weatherTableView.frame.width, height: 100))
        header.backgroundColor = .yellow
        weatherTableView.tableHeaderView = header
    }
    
    func addAllConstraints() {
        weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weatherTableView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.85).isActive = true
        weatherTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

    }
    
}
