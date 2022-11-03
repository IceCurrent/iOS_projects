import Foundation


struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather : [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather : Codable{
    let id: Int
}
//Note that the name of these should exactly match to the json data for it to decode that correctly. And the sole purpose of creating these stucts is to just complie the code, otherwise swift will ask what is main, what is temp where we printed decodedData.main.print, there is no any other function of these structs. The main player here is the JSON decoder object which apple provides us to decode the json data in swift and tap it in our functions.
    
