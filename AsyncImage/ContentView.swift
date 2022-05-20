//
//  ContentView.swift
//  AsyncImage
//
//  Created by Alexey Strelnikov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    let imageURL = "https://images.unsplash.com/photo-1652986708172-935f37f52fef?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774"
    var body: some View {
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring())) { phase in
            switch phase {
            case .empty:
                Color.purple.opacity(0.1)
         
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
         
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
         
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        }
        .frame(width: 300, height: 500)
        .cornerRadius(20)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
