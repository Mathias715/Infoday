//
//  NewsView.swift
//  Infoday
//
//  Created by f2501029 on 14/9/2022.
//

import SwiftUI

struct NewsView: View {
    @State private var news: [News] = []
    
    var body: some View {
        List(news) { newsItem in
            AsyncImage(url: URL(string: newsItem.image)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            Text(newsItem.title)
        }
        .onAppear(perform: startLoad)
        .refreshable {
            startLoad()
        }
    }
}


struct News: Identifiable {
    let id: Int
    let title: String
    let detail: String
    let image: String
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

extension NewsView {
    
    func handleClientError(_: Error) {
        return
    }
    
    func handleServerError(_: URLResponse?) {
        return
    }
    
    func startLoad() {
        
        let url = URL(string: "https://api.npoint.io/a8cea79c033ace1c8b8b")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                self.handleClientError(error)
                return
            } // explenation Powerpoint lecture 2
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            } // explenation Powerpoint lecture 2
            
            //            if let data = data,
            //               let string = String(data: data, encoding: .utf8) {
            //
            //                self.news = [News(id: 0, title: string, detail: "", image: "")]
            //            }
            if let data = data, let news = try? JSONDecoder().decode([News].self, from: data) {
                
                self.news = news
            }
        }
        
        task.resume()
    }
}

extension News: Decodable {}

