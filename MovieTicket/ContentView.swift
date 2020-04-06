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
    var movies = moviesData
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

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing : 18) {

//                        ForEach(0..<movies.count , id: \.self) { index in
                            GeometryReader { geo in
                                ZStack {
                                    
//                                    Movie(movie: self.movies[0], amharic: self.$amahric)
                                    MovieView(movie: self.movies[0], show: self.$show, amharic: self.$amahric)
//

                                }
                            }.frame(maxHeight : show ? 1000 : 600)
                                .frame(width : show ? screen.width :330)
//                        }
                    }
                    .padding(.horizontal , 20)
                }
                .frame(height : show ? 1000 : 600)
//                .offset(y : show ? -200 : 0)
//                .animation(.linear)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieView: View {
    
    var movie : MovieModel
    @Binding var show : Bool
    @Binding var amharic : Bool
    
    var body: some View {
        VStack(alignment : .leading ,   spacing : 30) {
            Image(uiImage: movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: show ? .infinity: 330)
                .frame(maxHeight : show ? 600 : 450)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .offset(y : show ? -100 : 0)
                .shadow(color: Color.black.opacity(0.3), radius: 12, x: 0, y: 30)
            
            VStack(alignment : .leading , spacing: 10) {
                HStack {
                    Text("IMDb")
                        .padding(5)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .overlay(RoundedRectangle(cornerRadius: 3 , style : .continuous).stroke(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), lineWidth: 0.8))
                    Text("8.4")
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
                Text(amharic ? "\(movie.amh_title)" : "\(movie.title)")
                    .font(.system(size: 20, weight: .bold))
                Text(amharic ? "\(movie.amh_cathagory)" : "\(movie.cathagory)")
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            }
            
            
        }
        .frame(width: 330)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct MovieModel : Identifiable{
    var id = UUID()
    var image : UIImage
    var title : String
    var amh_title : String
    var amh_cathagory : String
    var cathagory : String
   
}

var moviesData = [
    

    MovieModel(image:  #imageLiteral(resourceName: "lamb"), title: "Lamb - A Film By Yared Zeleke", amh_title: "ላምብ - ያረድ ዠለከ ፊልም, ", amh_cathagory: "ኣጉዋጊ , ኣድቨንሸረ" , cathagory: "Drame , Adventure , Thriler"),
    MovieModel(image:  #imageLiteral(resourceName: "difret"), title: "Defret -Based On A True Story", amh_title: "ዲፍረት አውነት ታሪክ", amh_cathagory: "ኣጉዋጊ , ኣድቨንሸረ , ፊኪር" , cathagory: "Thriler , Adventure , Romance"),
    MovieModel(image:  #imageLiteral(resourceName: "johnWick"), title: "John Wick Chapter 3", amh_title: "ጆህን ወአክ ጫፕተር ፫", amh_cathagory: "ኣችቲኦን , ኣድቨንሸረ , ፊኪር" , cathagory: "Action , Adventure , Thriler")


]
