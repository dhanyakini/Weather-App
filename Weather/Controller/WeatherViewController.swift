//
//  WeatherViewController.swift
//  Weather
//
//  Created by Dhanya Kini on 03/11/23.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView! // Add an IBOutlet for the background image view
    @IBOutlet weak var searchButton: UIButton! // Add an IBOutlet for the search button
    @IBOutlet weak var locationButton: UIButton! // Add an IBOutlet for the location button
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        
        // Set initial colors from the adaptive color in Assets (if created)
        temperatureLabel.textColor = UIColor(named: "AdaptiveTextColor")
        cityLabel.textColor = UIColor(named: "AdaptiveTextColor")
        searchButton.setTitleColor(UIColor(named: "AdaptiveTextColor"), for: .normal)
        locationButton.setTitleColor(UIColor(named: "AdaptiveTextColor"), for: .normal)
    }
    
    // Button action for selecting background image
    @IBAction func selectBackgroundImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // UIImagePickerControllerDelegate method - called when user selects an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            backgroundImageView.image = image // Set the selected image as the background
            updateTextColor(for: image) // Adjust text color based on brightness
        }
        dismiss(animated: true, completion: nil)
    }
    
    // Adjust text color for labels and buttons based on the brightness of the selected image
    func updateTextColor(for image: UIImage) {
        let brightness = image.averageBrightness()
        let adaptiveColor: UIColor = brightness > 0.5 ? .black : .white
        
        // Apply adaptive color to text elements
        temperatureLabel.textColor = adaptiveColor
        cityLabel.textColor = adaptiveColor
        searchButton.setTitleColor(adaptiveColor, for: .normal)
        locationButton.setTitleColor(adaptiveColor, for: .normal)
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
