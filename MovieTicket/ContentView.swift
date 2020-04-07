//
//  ContentView.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 3/31/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import SwiftUI

// .scaleEffect(
//                                             geo.frame(in: .global).minX < 269 &&
//                                             geo.frame(in: .global).minX  > -80 ? 1 : 0.9)

struct ContentView: View {
//    var movies = moviesData
    @State var amahric = false
    @State var show = false
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(amahric ? "አሁን የሚታይ" : "Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button(action : {self.amahric.toggle()}) {
                        Text("A")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 0)
                            .shadow(color: Color.black.opacity(0.3), radius: 12, x: 0, y: 20)
                    }
                
                    
                    
                }
                .padding()
                .padding(.leading , 10)
                
                Text(amahric ? "ኣሁን የታህ" : "Now Playing")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal , 30)
                    .padding(.top, 30)

                MovieList()
                .offset(y : self.show ?  -175 : 0)
                .frame(height : show ? 1000 : 650)
                .zIndex(self.show ? 1 : 0)
                
                
//                .offset(y : show ? -200 : 0)
//                .animation(.linear)
            }.onAppear(perform: {
                let movies = Movie()
                movies.fetchMovies { (res) in
                    
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//var moviesData = [
//
//
//    MovieModel(image:  #imageLiteral(resourceName: "lamb"), title: "Lamb - A Film By Yared Zeleke", amh_title: "ላምብ - ያረድ ዠለከ ፊልም, ", amh_cathagory: "ኣጉዋጊ , ኣድቨንሸረ" , cathagory: "Drame , Adventure , Thriler"),
//    MovieModel(image:  #imageLiteral(resourceName: "difret"), title: "Defret -Based On A True Story", amh_title: "ዲፍረት አውነት ታሪክ", amh_cathagory: "ኣጉዋጊ , ኣድቨንሸረ , ፊኪር" , cathagory: "Thriler , Adventure , Romance"),
//    MovieModel(image:  #imageLiteral(resourceName: "johnWick"), title: "John Wick Chapter 3", amh_title: "ጆህን ወአክ ጫፕተር ፫", amh_cathagory: "ኣችቲኦን , ኣድቨንሸረ , ፊኪር" , cathagory: "Action , Adventure , Thriler")
//
//
//]
