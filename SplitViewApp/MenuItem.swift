//
//  MenuItem.swift
//  SplitViewApp
//
//  Created by Vasichko Anna on 11.11.2022.
//

import Foundation

struct MenuItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    var subMenuItems: [MenuItem]?
    
    
    static func getMenuItem() -> MenuItem {
        MenuItem(name: "", image: "")
    }
    
    func getMainMenuItems() -> [MenuItem] {
        DataStore.share.mainMenuItems
    }
    
    func getSubMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
        guard let menuItem = DataStore.share.mainMenuItems.first(where: { $0.id == id }) else {
            return nil
        }
        return menuItem.subMenuItems
    }
    
//    static func getMainMenuItems() -> [MenuItem] {
//        let mainMenuItems = DataStore.share.mainMenuItems
//        func getSubMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
//            guard let menuItem = DataStore.share.mainMenuItems.first(where: { $0.id == id }) else {
//                return nil
//            }
//            return menuItem.subMenuItems
//        }
//
//        return mainMenuItems
//    }
//
//    func getSubMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
//        guard let menuItem = DataStore.share.mainMenuItems.first(where: { $0.id == id }) else {
//            return nil
//        }
//        return menuItem.subMenuItems
//    }
//
//    static func getSubMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
////        guard let id else {
////            return DataStore.share.mainMenuItems
////        }
//        guard let menuItem = DataStore.share.mainMenuItems.first(where: { $0.id == id }) else {
//            return nil
//        }
//        return menuItem.subMenuItems
//    }
    
}




