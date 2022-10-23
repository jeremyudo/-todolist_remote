//
//  todolistApp.swift
//  todolist
//
//  Created by Jeremy Udo on 10/16/22.
//
/* MVVM Architecture
    Model - data point
    View - UI
    View Model - manages models for view
 */
import SwiftUI

@main
struct todolistApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
