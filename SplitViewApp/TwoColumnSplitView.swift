//
//  ContentView.swift
//  SplitViewApp
//
//  Created by Vasichko Anna on 11.11.2022.
//

import SwiftUI

struct TwoColumnSplitView: View {
   
    @State private var selectedCategoryId: MenuItem.ID?
    
    private var course = Course()
    
    var body: some View {
        NavigationSplitView {
              List(course.mainMenuItems, selection: $selectedCategoryId) { item in
                  HStack {
                      Image(systemName: item.image)
                          .resizable()
                          .frame(width: 50, height: 50)
                          .foregroundColor(.orange)
                      Text(item.name)
                          .font(.system(.title2))
                          .bold()
                  }
              }
   
              .navigationTitle("Courses")
   
          } detail: {
              if let selectedCategoryId,
                 let categoryItems = course.getSubMenuItems(for: selectedCategoryId) {
   
                  List(categoryItems) { item in
                      HStack {
                          Image(systemName: item.image)
                              .resizable()
                              .frame(width: 50, height: 50)
                              .foregroundColor(.green)
                          Text(item.name)
                              .font(.system(.title3))
                              .bold()
                      }
                  }
                  .listStyle(.plain)
                  .navigationBarTitleDisplayMode(.inline)
   
              } else {
                  Text("Please select a category")
              }
          }
    }
}

struct TwoColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnSplitView()
    }
}
