//
//  ListRowView.swift
//  todolist
//
//  Created by Jeremy Udo on 10/19/22.
//

import SwiftUI

struct ListRowView: View {
    // title is now a constant for undeclared value
    let item: ItemModel // allows text in title to be dynamic
    
    var body: some View {
        // HStack: aka horizontal stack is responsible for creating the checkmark
        HStack {
            // Image adds an image which in this case i chose for it to be checkmark. after the checkmark on the same horizontal line, the title is added.  
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)// this is how you add an image from the system(the image is a checkmark)
            Text(item.title)
            Spacer() // pushes everything to the left
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second item!", isCompleted: false)
    static var item3 = ItemModel(title: "Third item!", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
        }
        .previewLayout(.sizeThatFits)
    }
}
