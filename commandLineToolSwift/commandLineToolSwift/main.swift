//
//  main.swift
//  commandLineToolSwift
//
//  Created by ekincare on 20/11/23.
//

import Foundation
import SwiftUI


//MARK: CommandLine

//var x = readLine()!
//print(x)
//
//var n =  Int(readLine()!)!
//print(n)
//
//let arr = readLine()!.split(separator: " ")
//print(arr)



//var n =  Int(readLine()!)!
//for _ in 0..<n{
//    guard let inputs = readLine()?.split(separator: " ") else { continue }
//    print(inputs)
//}
//print("exit")



//guard let inputs = readLine()?.split(separator: " ") else { fatalError("Bad input") }
//print(inputs)



//var myArray = [Bool](repeating: true, count: n+1)
//let count = Int(truncating: NSDecimalNumber(decimal: pow(2, length)))
//print(n[n.index(n.startIndex, offsetBy: j)], terminator: "")



/*
 func practice(s: String){
     var characters = Array(s)
     let temp = characters[0]
     characters[0] = characters[1]
     characters[1] = temp
     print(String(characters))
 }
 */



//var a = "geeksforgeeks"
//var b = "forgeeksgeeks";
//print(a.sorted())
//print(b.sorted())





//MARK: Closure

protocol myDeciplineProtocol {
    var a : String { get}
}


class myDeciplineInstance : myDeciplineProtocol{
    var a : String
    var b : String{
        get{
            return "secondGet"
        }
        set{
            
        }
    }
    
    internal init(a: String = "firstooo", b: String = "second") {
        self.a = a
        self.b = b
    }
}


class abc{
    let tool: ((Int, String) -> myDeciplineProtocol)
    
    internal init(tool: @escaping ((Int, String) -> myDeciplineProtocol)) {
        self.tool = tool
    }
    
    func performTask(){
        let a = tool(07, "Arbaaaaaz")
        print(a.a)
        //print(a.b)
    }
 
}


private func classicFTSCoordinatorFactory(from resolver: Int) -> ((Int, String) -> myDeciplineProtocol) {
    return { rootController, landingController in
        //        let connectAssembler = resolver.resolve(ConnectAssemblerProtocol.self)
        //        let connectCoordinator = connectAssembler?.resolveClassicFTSCoordinator(rootController: rootController, landingController: landingController)
        //        return connectCoordinator
        return myDeciplineInstance()
    }
}


//let obJ = abc(tool: classicFTSCoordinatorFactory(from: 101))
//obJ.performTask()



//let myClosure: (Int,String) -> myDeciplineProtocol = { count, name  in
//    // Perform some logic based on the input data
//    //if(name.count > count){
//        return myDeciplineInstance()
//    //}else{
////        return myDeciplineInstance()
////    }
//}


//let newObj = myDeciplineInstance()
//print(newObj.a)
//print(newObj.b)





//MARK: Swinject
/*

// Define a protocol
protocol DataService {
    func fetchData() -> String
}

// Create a class that conforms to the protocol
class RemoteDataService: DataService {
    func fetchData() -> String {
        return "Data fetched from remote service"
    }
}

// Create a class that conforms to the protocol
class RemoteDataServiceTwo: DataService {
    func fetchData() -> String {
        return "Data fetched from remote service"
    }
}

// Create another class that depends on DataService
class DataManager {
    // Create a Swinject container
    var container: Container = {
        let container = Container()
        // Register the DataService implementation with the container
        container.register(DataService.self) { _ in
            RemoteDataService()
        }

        container.register(DataService.self) { _ in
            RemoteDataServiceTwo()
        }

        // Register the DataManager class with the container
        container.register(DataManager.self) { resolver in
            let dataService = resolver.resolve(DataService.self)!
            return DataManager(dataService: dataService)
        }

        return container
    }()

    let dataService: DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func processData() {
        let data = dataService.fetchData()
        print("Processing data: \(data)")
    }
}

class Hoolll {
    func abckdh() {
        // Use the container to resolve an instance of DataManager
        let container = Container()
        let dataManager = container.resolve(DataManager.self)!

        // Use the DataManager to process data
        dataManager.processData()
    }
}

*/





//MARK: State Pattern
/*
// Define a protocol for the states
protocol State {
    func performAction(context: Context)
}

// Create concrete state implementations
class StateA: State {
    func performAction(context: Context) {
        print("State A Action")
        context.state = StateB()
    }
}

class StateB: State {
    func performAction(context: Context) {
        print("State B Action")
        context.state = StateA()
    }
}

// Create a context that holds the current state
class Context {
    var state: State

    init(state: State) {
        self.state = state
    }

    func request() {
        state.performAction(context: self)
    }
}

// Example usage
let initialState = StateA()
let context = Context(state: initialState)

//for i in 0...100{
//    context.request()
//}

//context.request()  // Output: State A Action
//context.request()  // Output: State B Action
//context.request()  // Output: State A Action



// Define a protocol for the traffic signal states
protocol TrafficSignalState {
    func handle() -> String
}

// Create concrete state implementations for different signal colors
class RedState: TrafficSignalState {
    func handle() -> String {
        return "Stop. Do not proceed."
    }
}

class GreenState: TrafficSignalState {
    func handle() -> String {
        return "Go. You can proceed."
    }
}

class YellowState: TrafficSignalState {
    func handle() -> String {
        return "Caution. Prepare to stop."
    }
}

// Create a context for the traffic signal that holds the current state
class TrafficSignal {
    var state: TrafficSignalState

    init(state: TrafficSignalState) {
        self.state = state
    }

    func request() -> String {
        return state.handle()
    }
}

// Example usage
let initialSignalState = RedState()
let trafficSignal = TrafficSignal(state: initialSignalState)

print(trafficSignal.request())  // Output: Stop. Do not proceed.

// Change the state to Green
trafficSignal.state = GreenState()
print(trafficSignal.request())  // Output: Go. You can proceed.

*/


//open class TWViewController{
//    
//}
//
//open class TWSwiftUIViewController<V: View> {
//    
//}
//
//
//

//func myClosure(completion: (Int) -> (Bool)){
//    print("called")
//    let a = completion(101)
//    print(a)
//}
//
//myClosure { val in
//    print("completion called")
//    if(val == 102){
//        return true
//    }else{
//        return false
//    }
//}

