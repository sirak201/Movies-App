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
    @State var avalible_courses = courses
    @State var hiddeStatus = false
    @State var active = -1


    var body: some View {
        
        ZStack {
           ScrollView {
                VStack(spacing : 30) {
                    GeometryReader { geo in
//                        CourseView(show: self.$show, hiddeStatus: self.$hiddeStatus, activeIndex: self.$active, index: 0, course: self.avalible_courses[0])
                        
                        Movie(movie: moviesData[0], show: self.$show, amharic: .constant(false))
                            .offset(y : self.show ? -geo.frame(in : .global).minY - 10 : 0)
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



struct CourseView: View {
    @Binding var show : Bool
    @Binding var hiddeStatus : Bool
    @Binding var activeIndex : Int
    var index : Int
    var course : Course
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment : .leading , spacing: 40) {
                Text("Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
                Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)
                Text("To follow this course, you'll need to download the source files so that you can compare your progress against mine. In the package, you'll find the design files, the final app and an Xcode project for each section of the course. Now that we have the basic full-screen card animation, we'll animate some new content underneath. Additionally, we'll implement a close button that will dismiss the full view.")
                }
            .padding(30)
                
            .frame(maxWidth : show ? .infinity: screen.width - 60 , maxHeight: show ? .infinity : 280 , alignment: .top)
                
            .offset(y : show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 28 , style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            
            VStack{
                HStack{
                    VStack(alignment : .leading , spacing : 8) {
                        Text("\(course.title)")
                            .foregroundColor(Color.white)
                            .font(.system(size: 24, weight: .bold))
                        Text("\(course.subtitle)")
                            .foregroundColor(Color.white.opacity(0.8))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.white)
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth : .infinity , alignment: .top)
                    .frame(height : 180)
                
            }
            .padding(20)
            .padding(.top , show ? 50 : 0)
            .frame(maxWidth : show ? .infinity: screen.width - 60 , maxHeight: show ? 460: 280)
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 28 , style: .continuous))
            .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
                self.show.toggle()
                self.hiddeStatus.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                     self.activeIndex = -1
                }
            }
        }.frame(height : show ? screen.height : 280)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                   .edgesIgnoringSafeArea(.all)
    }
}


struct Course : Identifiable {
    var id = UUID()
    var title : String
    var subtitle : String
    var image : UIImage
    var logo : UIImage
    var color : UIColor
    var show : Bool
}


let courses = [

    Course(title: "Protype Design In Swift Ui", subtitle: "18 Section", image: #imageLiteral(resourceName: "johnWick"), logo: #imageLiteral(resourceName: "lamb"), color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Section", image: #imageLiteral(resourceName: "difret"), logo: #imageLiteral(resourceName: "spiderman"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design For Developers", subtitle: "15 Section", image: #imageLiteral(resourceName: "lamb"), logo: #imageLiteral(resourceName: "johnWick"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false),

]
