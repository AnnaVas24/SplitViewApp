//
//  MenuItem.swift
//  SplitViewApp
//
//  Created by Vasichko Anna on 11.11.2022.
//

import Foundation

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}


struct Course {
    let mainMenuItems = {
        let swiftMenuItems = [
            MenuItem(name: "Basics of Programming", image: "desktopcomputer"),
            MenuItem(name: "Swift first steps", image: "swift"),
        ]
        let appsMenuItems = [
            MenuItem(name: "MVC pattern", image: "wrench.and.screwdriver.fill"),
            MenuItem(name: "UIKit", image: "shippingbox.fill"),
        ]
        let topMenuItems = [
            MenuItem(name: "Swift Basics", image: "swift", subMenuItems: swiftMenuItems),
            MenuItem(name: "First Apps", image: "applelogo", subMenuItems: appsMenuItems)
        ]
        return topMenuItems
    }()
    
     func getSubMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
         guard let menuItem = mainMenuItems.first(where: { $0.id == id }) else {
             return nil
         }
         return menuItem.subMenuItems
     }
    
}
