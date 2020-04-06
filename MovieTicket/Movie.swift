//
//  Movie.swift
//  MovieTicket
//
//  Created by Sirak Zeray on 4/3/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import SwiftUI

struct Movie: View {
    
    var movie : MovieModel
    @Binding var show : Bool
    @Binding var amharic : Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment : .leading , spacing: 40) {
                Text("Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
                Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)
                Text("To follow this course, you'll need to download the source files so that you can compare your progress against mine. In the package, you'll find the design files, the final app and an Xcode project for each section of the course. Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
                }
            .padding(20)
            .frame(maxWidth : show ? .infinity: screen.width - 60 , maxHeight: show ? .infinity : 280 , alignment: .top)
            .offset(y : show ? 700 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 28 , style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            
            
            
            
            VStack(alignment : .leading ,   spacing : 30) {
                Image(uiImage: movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
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
//                .padding(.leading , show ? 20 : 0)
                
                
            }
//            .padding(20)
//            .padding(.top , show ? 50 : 0)
            .frame(maxWidth : show ? .infinity: screen.width - 60 , maxHeight: show ? 700: 700)
            .onTapGesture {
                self.show.toggle()
            }
        }
        .frame(height : show ? screen.height : 650)
        .animation(.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0))
    }
}

struct Movie_Previews: PreviewProvider {
    static var previews: some View {
        Movie(movie: moviesData[0], show: .constant(false), amharic: .constant(false))
    }
}


let screen = UIScreen.main.bounds
