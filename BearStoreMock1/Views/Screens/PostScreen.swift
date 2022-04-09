//
//  PostScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct PostScreen: View {
    
    @ObservedObject var vm : BearViewModel = Resolver.resolve()
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    @State private var condition: Int = 0
    
    var body: some View {
        VStack(spacing: Dm.small) {
            
            // title
            Text("Post a Toy")
                .font(.system(size:FontSize.xlarge))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, Dm.medium)
            
            // name
            InputField(text:$name, title: "Name")
            
            // descriptione
            InputField(text:$description, title: "Description", height: Dm.xxlarge * 2)
            
            // pric
            PriceInputField(text:$price, title: "Price")
            
            // Condition
            RatingBar(rating: $condition, title: "Condition")

            RoundedCornerButton(label:"Post"){
                post()
            }
            .padding(.vertical, Dm.small)
            
            Spacer()
        }
        .padding()
    }
    
    private func post() {
        
        // validate
        
        // add
        vm.add(
            Bear(
            name: name,
            description: description,
            price: price.floatValue,
            condition: condition)
        )
        
        resetFields()
    }
    
    private func resetFields() {
        name = ""
        description = ""
        price = ""
        condition = 0
    }
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}
