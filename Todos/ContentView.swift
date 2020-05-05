//
//  ContentView.swift
//  Todos
//
//  Created by eyup cimen on 5.05.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//
import ComposableArchitecture
import SwiftUI

struct Todo: Equatable , Identifiable {
    var description = ""
    let id : UUID
    var isComplete = false
}

struct AppState: Equatable {
    var todos : [Todo]
}

enum AppAction {
    
}

struct AppEnviroment {
}

let appReducer = Reducer<AppState, AppAction, AppEnviroment>{ state, action, enviroment in
    
    switch action {
        
    }
}

struct ContentView: View {
    
    let store : Store<AppState, AppAction>
    /// @ObservedObject var viewStore
    
    var body: some View {
        
        NavigationView{
            
            WithViewStore(self.store) { viewStore in
                
                List{
                    
                    ForEach(viewStore.todos) { todo in
                        
                        HStack {
                            Button(action:{}) {
                                Image(systemName: todo.isComplete ? "checkmark.square" : "square")
                            }
                            .buttonStyle(PlainButtonStyle())
                            TextField(
                                "Untitled todo",
                                text : .constant(todo.description)
                            )
                        }
                        .foregroundColor(todo.isComplete ? .gray : nil)
                    }
                }
                .navigationBarTitle("Todo List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(initialState: AppState(
                todos: [
                    Todo(
                        description: "Milk",
                        id: UUID(),
                        isComplete: false
                    ),
                    Todo(
                        description: "Eggs",
                        id: UUID(),
                        isComplete: false
                    ),
                    Todo(
                        description: "Hand Soap",
                        id: UUID(),
                        isComplete: true
                    ),
            ]),
                         reducer: appReducer ,
                         environment: AppEnviroment())
        )
    }
}
