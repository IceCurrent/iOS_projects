import Foundation
import WebKit
import SwiftUI

//UIViewRepresentable protocol allows us to represent a Swift UI component as a UI Kit View
struct WebView: UIViewRepresentable {
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let safeUrl = URL(string: safeString){
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
}
