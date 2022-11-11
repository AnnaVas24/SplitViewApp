//
//  ThreeColumnSplitView.swift
//  SplitViewApp
//
//  Created by Vasichko Anna on 11.11.2022.
//

import SwiftUI

struct ThreeColumnSplitView: View {
    @State private var selectedCategoryId: MenuItem.ID?
    @State private var selectedItem: MenuItem?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    private var course = Course()
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
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
            
        } content: {
            if let selectedCategoryId,
               let subMenuItems = course.getSubMenuItems(for: selectedCategoryId) {
            
                List(subMenuItems, selection: $selectedItem) { item in
                    NavigationLink(value: item) {
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
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                
            } else {
                Text("Please select a category")
            }
        } detail: {
            if let selectedItem {
                Image(systemName: selectedItem.image)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.indigo)
            } else {
                Text("Please select an item")
            }
        }
    }
}

struct ThreeColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnSplitView()
    }
}
