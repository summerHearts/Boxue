//
//  WeekWeatherViewModel.swift
//  Sky
//
//  Created by Song Zixin on 2019/4/29.
//  Copyright © 2019 SilkSong. All rights reserved.
//

import UIKit

struct WeekWeatherViewModel {
    let weatherData: [ForecastData]
    
    private let dateFormatter = DateFormatter()
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func week(for index: Int) -> String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: weatherData[index].time)
    }
    
    func date(for index: Int) -> String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherData[index].time)
    }
    
    func temperatur(for index: Int) -> String {
        let min = format(temperature: weatherData[index].temperatureLow)
        let max = format(temperature: weatherData[index].temperatureHigh)
        
        return "\(min) - \(max)"
    }
    
    func weatherIcon(for index: Int) -> UIImage? {
        return UIImage.weatherIcon(of: weatherData[index].icon)
    }
    
    func humidity(for index: Int) -> String {
        return String(format: "%.0f %%", weatherData[index].humidity * 100)
    }
    
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureMode() {
        case .celsius:
            return String(format: "%.0f °C", temperature.toCelcius())
        case .fahrenheit:
            return String(format: "%.0f °F", temperature)
        }
    }
}
