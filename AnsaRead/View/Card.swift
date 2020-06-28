//
//  Card.swift
//  AnsaRead
//
//  Created by Alessandro Giaquinto on 28/06/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI



struct Card: View {
    let title:String
    let description:String
    let url:String
    
    
    var body: some View {
        HStack(alignment: .top){
            Image(systemName:"paperplane.fill")
            .resizable()
                .frame(width: 25.0, height: 25.0)
                .foregroundColor(Color.green)
            .onTapGesture {
                UIApplication.shared.open(URL(string: self.url)!)
            }
            Spacer()
            VStack(alignment: .leading){
                Text(self.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.green)
                    .lineLimit(2)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: self.url)!)
                    }
                Text(self.description)
                    .font(.body)
                    .fontWeight(.light)
            }
            Spacer()
        }
        //.padding(.all, 10.0)
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title:"Dopo Coca Cola anche Starbucks decide di boicottare Facebook", description:"Stop alla pubblicità sulla piattaforma e su altre piattaforme(?)", url:"https://recensility.it")
    }
}
