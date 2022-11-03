import Foundation


struct WeatherModel{
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    
    //a really cool stuff in swift:
    
    // what it does is get the return value out of the body and assigns it to the variable conditionName
    // a more cooler way to write functions huh! These are called computed variables in swift, that do not just get themselves assigned a value, but they workout some code and get the output assigned to them
    
    
    // here conditionName is not a method but a property of the struct
    //computed propertys are always declared using var
    
    var conditionName: String {
        switch(conditionID){
            
        case (200...232):
            return "cloud.bolt"
        
        case (300...321):
            return "cloud.drizzle"
            
        case (500...531):
            return "cloud.rain"
            
        case (600...622):
            return "snowflake"
            
        case (701...781):
            return "cloud.fog"
            
        case (800):
            return "sun.max"
            
        case (801...804):
            return "cloud"
        
        default:
            return "cloud"
            
        }
    }
    
    var temperatureString: String {
        return(String(format: "%.1f", temperature))
    }
    

//    func getConditionName(weatherID: Int) -> String {
//        switch(weatherID){
//
//        case (200...232):
//            return "cloud.bolt"
//
//        case (300...321):
//            return "cloud.drizzle"
//
//        case (500...531):
//            return "cloud.rain"
//
//        case (600...622):
//            return "snowflake"
//
//        case (701...781):
//            return "cloud.fog"
//
//        case (800):
//            return "sun.max"
//
//        case (801...804):
//            return "cloud"
//
//        default:
//            return "cloud"
//
//        }
//    }

}
