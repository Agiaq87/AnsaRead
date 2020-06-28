//
//  ErrorCard.swift
//  AnsaRead
//
//  Created by Alessandro Giaquinto on 28/06/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct ErrorCard: View {
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(Color.red)
            Text("Encounted error")
                .font(.largeTitle)
        }
    }
}

struct ErrorCard_Previews: PreviewProvider {
    static var previews: some View {
        ErrorCard()
    }
}
