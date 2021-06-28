//
//  NetworkService.swift
//  Weather
//
//  Created by Ivan on 6/18/21.
//

import Foundation

class NetworkService {
    
    func networkRequest(by stringUrl: String, complition: @escaping (WeatherData) -> ()){
        var jsonWeather = WeatherData()
        
        if let url = URL(string: stringUrl) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
//
//                        print(json)
                        
                        let decoder = JSONDecoder()
                        jsonWeather = try decoder.decode(WeatherData.self, from: data)
                        //print(jsonWeather)
                        
                        complition(jsonWeather)
                        
                    } catch let error {
                        print("Convert in json ERROR: ", error)
                    }
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Status code getWeatherData: ", response.statusCode)
                }
                
                if let err = error {
                    print("Network ERROR!: \(err)")
                }
            }).resume()
        }
    }
    
    func networkRequestforCityName(by stringUrl: String, complition: @escaping (CityName) -> ()){
        var jsonCityName = CityName()
        
        if let url = URL(string: stringUrl) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
//
//                        print(json)
                        let decoder = JSONDecoder()
                        jsonCityName = try decoder.decode(CityName.self, from: data)
                        //print(jsonWeather)
                        
                        complition(jsonCityName)
                        
                    } catch let error {
                        print("Convert in json ERROR: ", error)
                    }
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Status code getCity: ", response.statusCode)
                }
                
                if let err = error {
                    print("Network ERROR!: \(err)")
                }
            }).resume()
        }
    }
}
