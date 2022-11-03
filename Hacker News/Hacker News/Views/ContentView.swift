import SwiftUI

struct ContentView: View {
    
    //Network Manager is an observable object, it has a @published property which notifies the listener or observer, the changes that happen to the property. The observer here is the var networkManager because it has got the tag @ObservedObject
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        //To create a navigation stack, which adds a navigation bar to our screens we embed our code in a navigation view
        
        NavigationView{
            //Table views in swift UI are called Lists
            List(networkManager.posts) { post in
                //NavigationLink creates the cell active
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                            .padding([.top, .leading, .bottom], 8.0)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        
        //every navigation view comes with a property .onAppear which is like the analogous to viewDidLoad in the UI kit
        //so here we want to call the fetch data method whenever the view loads up.
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct Post : Identifiable{
//    
//    //For a struct to conform to an identifiable protocol, it must have a property named id
//    
//    let id: String
//    let title : String
//}

//let posts = [
//
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Namaste"),
//    Post(id: "3", title: "Hola")
//
//]

/* Real Work Cycle:
 as soon as the view loads up the on Appear method (view Did Load gets called), it triggers the fetch Data method whcih creates a @published posts variable, now whoever is subscribed to this will get notified of the changes in the database in real time. So whenever there is a change, then we don't need to call again the fetchData method, because this has been taken care by our state variable with the @published tag, it recreates itself to get the updates and therefore updating the table view content, (because it is also listened by a state variable, i.e. the networkManager with @ObservedObject property) */
