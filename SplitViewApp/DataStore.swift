//
//  DataStore.swift
//  SplitViewApp
//
//  Created by Vasichko Anna on 18.11.2022.
//


class DataStore {
    static let share = DataStore()
    
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
    
    private init() {}
}
