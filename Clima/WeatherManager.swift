import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager{
    var weatherURL =
        "https://api.openweathermap.org/data/2.5/weather?appid=6206d8b8b2257e38f546d212793487ea&units=metric"
    
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlStirng: String){
        /* 4steps of Networking:
         1- create a URL (basically create a URL object)
         2- create a URL session (it's like the analogous to the browser, and performs that function)
         3- give the Session a task (it's like giving the browser URL)
         4- start the task (it's like hitting the enter button to tell the browser to execute the task)*/
        
        //1. create a URL
        if let url = URL(string: urlStirng){
            
            //2. create a URL session
            let session = URLSession(configuration: .default)
            
            //3. give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            
            //4. start the task
            task.resume()
            
        }
    }
    
    func parseJSON (_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //decodedData has become a WeatherData datatype
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
