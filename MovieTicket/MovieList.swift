//
//  MovieList.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 4/3/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    
    @State var show : Bool = false
    @State var hiddeStatus = false
    @State var active = -1


    var body: some View {
        
        ZStack {
           ScrollView {
                VStack(spacing : 30) {
                    GeometryReader { geo in
                        Text("")
//                        Movie(movie: moviesData[0], show: self.$show, amharic: .constant(false))
//                            .offset(y : self.show ? -geo.frame(in : .global).minY - 10 : 0)
                    }
                    .frame(height: 650)
                    .frame(maxWidth: self.show ? .infinity : screen.width - 60)
                
                }.frame(width : screen.width)
          }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}





