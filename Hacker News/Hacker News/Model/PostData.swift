import Foundation


//Results conform to the Decodable protocol
struct Results: Decodable{
    
    let hits: [Post]
    
}


struct Post: Decodable, Identifiable{
    
    var id : String {
        return objectID
    }
    
    let points : Int
    let title : String
    let url : String?
    let objectID : String
}
