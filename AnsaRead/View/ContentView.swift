//
//  ContentView.swift
//  AnsaRead
//
//  Created by Alessandro Giaquinto on 25/06/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import FeedKit

struct ContentView: View {
    @ObservedObject var env:Environment = Environment()
    
    var body: some View {
        VStack{
            Image("logo.png")
            if self.env.getStatus(){
                ErrorCard()
            } else {
                List {
                    Section(content: {
                        HStack(alignment: .top){
                            Image(systemName: "house.fill")
                                .foregroundColor(Color.green)
                            Text("Homepage")
                        }
                    })
                        ForEach(0..<self.env.getCount()){ i in
                            self.env.getNews(index: i)
                        }
                }
            }  
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

