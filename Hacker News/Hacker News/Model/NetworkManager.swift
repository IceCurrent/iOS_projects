
import Foundation

/* 4 steps of Networking :
    1. create a URL
    2. create a URL session
    3. give the session a task
    4. Start the task   */



//the decoded data in the form of Results data type object named results needs to be shown in the table view in our content view, for that to happen we need our Network Manager to conform to the ObservableObject protocol
class NetworkManager : ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error)
                        }

                    }
                }
            }
            task.resume()
        }
    }
}
