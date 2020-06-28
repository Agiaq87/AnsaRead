//
//  Environment.swift
//  AnsaRead
//
//  Created by Alessandro Giaquinto on 25/06/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation
import FeedKit
import SwiftUI

public class Environment:ObservableObject{
    private let parser:FeedParser?
    private var alert:Bool
    private let arr:[RSSFeedItem]?
    private let count:Int?
    
    
    public init() {
        self.parser = FeedParser(URL: URL(string: "https://www.ansa.it/sito/ansait_rss.xml")!)
        
        guard let result = self.parser?.parse() else {
            self.alert = true
            self.arr = nil
            self.count = 0
            return
        }
        
        switch result {
        case .success(let feed):
            self.count = feed.rssFeed?.items?.count
            self.arr = feed.rssFeed?.items
        case .failure(let error):
            print(error)
            // Code repeat for let declaration (constant)
            self.alert = true
            self.arr = nil
            self.count = 0
            // End code repeat
        }
        
        self.alert = false
    }
    
    public func getAllNews() -> [RSSFeedItem]{
        return self.arr! as [RSSFeedItem]
    }
    
    public func getStatus() -> Bool {
        return self.alert
    }
    
    public func getCount() -> Int{
        return self.count! as Int
    }
    
    public func getNews(index:Int) -> AnyView {
        return AnyView(Card(title: self.arr![index].title!, description: self.arr![index].description!, url: self.arr![index].link!))
    }
}
