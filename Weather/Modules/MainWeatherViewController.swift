//
//  ViewController.swift
//  Weather
//
//  Created by Ivan on 6/16/21.
//

import UIKit
import CoreLocation

class MainWeatherViewController: UIViewController {
    
    var cityNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Name of city"
        return label
    }()
    
    var discriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "weather disciption"
        return label
    }()
    
    var tempLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60)
        label.textAlignment = .center
        label.text = "Temp"
        return label
    }()
    

    var weatherTableView: UITableView = {
        var table = UITableView()
        table.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        table.register(DailyTableViewCell.nib(), forCellReuseIdentifier: DailyTableViewCell.identifier)
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
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherTableView.estimatedRowHeight = 100
        weatherTableView.rowHeight = UITableView.automaticDimension
        
        getLocationCoordinates()
        
        addAllViews()
        addAllConstraints()
        
    }
}

//MARK: - TableView delegate and dataSorce
extension MainWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if weatherData.current.dt == 0 {
            return 0
        }else{
            return 12
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        let dailyCell = weatherTableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        
        switch indexPath.row {
        case 0:
            dailyCell.collectionView.backgroundColor = .brown
            dailyCell.cinfigure(to: weatherData)
            return dailyCell
        case 1:
            cell.subtitleLabel.isHidden = true
            cell.mainLabel.text = "The discription of weather"
            return cell
        case 2:
            cell.subtitleLabel.text = "SUNRISE"
            cell.mainLabel.text = "\(self.weatherData.current.sunrise)"
            return cell
        case 3:
            cell.subtitleLabel.text = "SUNSET"
            cell.mainLabel.text = "\(self.weatherData.current.sunset)"
            return cell
        case 4:
            cell.subtitleLabel.text = "CHANCE OF RAIN"
            cell.mainLabel.text = "\(Int(self.weatherData.daily[0].pop) * 100) %"
            return cell
        case 5:
            cell.subtitleLabel.text = "HUMIDITY"
            cell.mainLabel.text = "\(self.weatherData.current.humidity) %"
            return cell
        case 6:
            cell.subtitleLabel.text = "WIND"
            cell.mainLabel.text = "\(self.weatherData.current.wind_speed) m/s"
            return cell
        case 7:
            cell.subtitleLabel.text = "FEELS LIKE"
            cell.mainLabel.text = "\(self.weatherData.current.feels_like)°"
            return cell
        case 8:
            cell.subtitleLabel.text = "PRECIPITATION"
            if let rain = self.weatherData.daily[0].rain {
                cell.mainLabel.text = "\(rain) cm"
            } else{
                cell.mainLabel.text = "\(0) cm"
            }
            return cell
        case 9:
            cell.subtitleLabel.text = "PRESSURE"
            cell.mainLabel.text = "\(self.weatherData.current.pressure) hPa"
            return cell
        case 10:
            cell.subtitleLabel.text = "VISIBILITY"
            cell.mainLabel.text = "\(self.weatherData.current.dew_point) m"
            return cell
        case 11:
            cell.subtitleLabel.text = "UV INDEX"
            cell.mainLabel.text = "\(self.weatherData.current.uvi)"
            return cell
        default:
            return cell
        }
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
            
            var date = Date(timeIntervalSince1970: weatherData.hourly[0].dt)
            let dateFormater = DateFormatter()
            dateFormater.timeZone = TimeZone(identifier: "ru")
            
            print(date)
            
            DispatchQueue.main.async {
                self.showDiscription(self.weatherData.daily[0].weather[0].description)
                self.showCurrentTemp(self.weatherData.daily[0].temp.day)
                self.weatherTableView.reloadData()
            }
        }
    }
    func getNetworkRequestOfCityName() {
        networkService.networkRequestforCityName(by: self.stringUrlCityName) { [weak self](curentData) in
            guard let self = self else {return}
            
            print(curentData)
            
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
        self.tempLabel.text = "\(Int(temp))" + "°"
        print(temp)
    }
}

//MARK: - Setting constraints and show Views
extension MainWeatherViewController {
    
    func addAllViews() {
        view.addSubview(cityNameLabel)
        view.addSubview(discriptionLabel)
        view.addSubview(weatherTableView)
        addHeaderfoeTable()
    }
    
    func addHeaderfoeTable() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: tempLabel.font.pointSize))
        header.backgroundColor = .yellow
        
        tempLabel.frame = header.bounds
        header.addSubview(tempLabel)
        
        weatherTableView.tableHeaderView = header
    }
    
    func addAllConstraints() {
        cityNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        cityNameLabel.heightAnchor.constraint(equalToConstant: cityNameLabel.font.pointSize).isActive = true
        cityNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        discriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 8).isActive = true
        discriptionLabel.heightAnchor.constraint(equalToConstant: discriptionLabel.font.pointSize).isActive = true
        discriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weatherTableView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 8).isActive = true
        weatherTableView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

    }
    
}
