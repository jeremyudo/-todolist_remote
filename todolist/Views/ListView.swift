//
//  ListView.swift
//  todolist
//
//  Created by Jeremy Udo on 10/19/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    // array is created to prevent from typing data manually
            
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                // creates a list
                List {
                    // loop on the items array to disp lay each index
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle()) // alters the style of the todo list
            }
        }
        // navigation title adds a title to top of navigation
        .navigationTitle("2DO")
        // this is how you add elements to the navigation bar
        .navigationBarItems(
            leading: EditButton(), // edit button is leading
            trailing: NavigationLink("Add", destination: AddView()) // navigation link with the text "add" to a new p age is trailing
            )
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


