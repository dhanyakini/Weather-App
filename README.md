# Weather App

## Overview

The Weather App is a mobile application built using Swift and UIKit, designed to provide users with up-to-date weather information for their desired locations. Users can search for weather data by city name or use their current location to receive personalized weather updates. One of the unique features of this app is its ability to customize the user interface by allowing users to select a background image from their photo library. The app intelligently adjusts text color based on the brightness of the selected image, ensuring optimal readability.

## Features

- **City Search**: Easily search for weather information by entering the city name in the search bar.
- **Current Location**: Utilize the device's GPS functionality to fetch weather data for the user's current location.
- **Background Image Selection**: Choose a background image from the photo library to personalize the app's appearance.
- **Dynamic Text Color**: The app automatically adjusts the text color based on the brightness of the background image, providing a better visual experience.
- **User-Friendly Interface**: Designed with simplicity in mind, the app provides a clean and intuitive user experience.

## Technologies Used

- **Swift**: The primary programming language for building the app.
- **UIKit**: The framework used for designing the app's user interface.
- **CoreLocation**: A framework that enables location-based services, allowing the app to access the user's current location.
- **Xcode**: The integrated development environment (IDE) used for developing and debugging the app.
- **OpenWeatherMap API**: The external API used to fetch current weather data.

## Installation

To run the Weather App on your local machine, follow these steps:

1. **Clone the Repository**:
   Open your terminal and run the following command to clone the repository:
   ```bash
   git clone https://github.com/dhanyakini/Weather-App.git
   ```

2. **Open the Project**:
   Navigate to the cloned project directory:
   ```bash
   cd Weather-App
   ```
   Then open the Xcode project file:
   ```bash
   open Weather.xcodeproj
   ```

3. **Run the App**:
   Select a simulator or connect a physical device, and click the **Run** button in Xcode to build and launch the app.

## Usage

- **Search for Weather**: Enter the name of the city in the search bar and press the search button to retrieve weather data.
- **Get Current Location Weather**: Tap the location button to fetch the weather for your current geographical location.
- **Select Background Image**: Tap the button to choose a background image from your photo library. The app will adjust the text color based on the selected image’s brightness for better readability.

## Contributing

Contributions are welcome! If you have suggestions for improvements or additional features, feel free to submit an issue or pull request. Here are some ways you can contribute:

- Report bugs or issues you encounter.
- Suggest new features or enhancements.
- Contribute code improvements or optimizations.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Thanks to the OpenWeatherMap API for providing weather data.
