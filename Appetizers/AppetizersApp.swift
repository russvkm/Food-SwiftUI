//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Shashank Pandey on 15/12/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var orders = Orders()
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(orders)
        }
    }
}
