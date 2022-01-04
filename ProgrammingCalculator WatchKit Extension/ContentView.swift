//
//  ContentView.swift
//  Calculator WatchKit Extension
//
//  Created by Austin Wright on 2/9/21.
//

import SwiftUI

var binaryValue:String = "0"
//** THE VIEW with it's private variables and structs **//
struct ContentView: View {
    //State variables in the Content view must be declared IN the view
    //@State var baseSwitch: Int = 0  //Base Switcher Bit
    @State var runNum: UInt8 = 0        //Running integer
    @State var currentOperation: Operation = .None
    @State var value = "0"   // next calculation

    let layout = [GridItem(.flexible())] //define button layout
    
    //UI Button Grid in order
    let buttons: [[CalculatorButton]] = [
        [ .D,.E,.F,.AC,],
        [ .A,.B,.C,.Equal,],
        [ .Seven,.Eight,.Nine,.AND,],
        [ .Four,.Five,.Six,.OR,],
        [ .One,.Two,.Three,.XOR],
        [ .Zero,.LPar,.RPar,.BFlip,],
        [ .LShift,.Ones,.Add,.Mult,],
        [ .RShift,.Twos,.Subt,.Div,],]

        //Button style to make a button grow in size when pressed
        struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1.8 : 1.0)
        }
    }

    /*Switch the value of answer's number base
    func numBaseSwitch(){
        baseSwitch += 1
        if(baseSwitch > 2){
            baseSwitch = 0
        }
    }*/
    
    
    //Handles button presses
    //Inspired by Afraz Siddiqui https://github.com/AfrazCodes/SwiftUI-Calculator/blob/master/Calculator/ContentView.swift
    //Switch to UInt8 to avoid endiness issues
    func OnButtonPress(button: CalculatorButton){
        switch button{
        case .Add, .Subt, .Mult, .Div, .Equal, .AND, .OR, .XOR, .LShift, .RShift, .Twos, .Ones, .BFlip:
            if button == .Add{
                self.currentOperation = .Add
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .Subt{
                self.currentOperation = .Subt
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .Mult{
                self.currentOperation = .Mult
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .Div{
                self.currentOperation = .Div
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .AND{
                self.currentOperation = .AND
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .OR{
                self.currentOperation = .OR
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .XOR{
                self.currentOperation = .XOR
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .LShift{
                self.currentOperation = .LShift
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .RShift{
                self.currentOperation = .RShift
                self.runNum = UInt8(self.value) ?? 0
            }
            else if button == .BFlip{
                self.currentOperation = .BFlip
                //self.runNum = UInt8(self.value) ?? 0
                //self.value = "\(UInt8(~self.value))"
            }
            else if button == .Equal{
                let runValue = self.runNum
                let curValue = UInt8(self.value) ?? 0
                switch self.currentOperation {
                case .Add:
                    self.value = "\(runValue + curValue)"
                case .Subt:
                    self.value = "\(runValue - curValue)"
                case .Mult:
                    self.value = "\(runValue * curValue)"
                case .Div:
                    self.value = "\(runValue / curValue)"
                case .AND:
                    self.value = "\(runValue & curValue)"
                case .OR:
                    self.value = "\(runValue | curValue)"
                case .XOR:
                    self.value = "\(runValue ^ curValue)"
                case .LShift:
                    self.value = "\(runValue << curValue)"
                case .RShift:
                    self.value = "\(runValue >> curValue)"
                case .BFlip:
                    self.value = "\(~curValue)"
                case .None:
                    break
                }
            }
            if button != .Equal && button != .BFlip{
                self.value = "0"
            }
        case .AC:
            self.value = "0"
        case .LPar:
            print("Hi")
        case .RPar:
            print("Hi")
        default:
            var num = button.rawValue
            switch num{
            case "A":
                num = "10"
            case "B":
                num = "11"
            case "C":
                num = "12"
            case "D":
                num = "13"
            case "E":
                num = "14"
            case "F":
                num = "15"
            default:
                print("A decimal")
            }
            if self.value == "0"{
                value = num
            }
            else{
                self.value = "\(self.value)\(num)"
            }
        }
        binaryValue = String(Int(self.value) ?? 0, radix: 2)
        
    } //End of OnButtonPress Function*/

    var body: some View {                   //This View
        VStack(spacing: 0){
            VStack(spacing: 0){
                ScrollView(.horizontal){
                Text(binaryValue) //Binary expressionn representation text field
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                }
            }
            VStack(spacing: 0){
                HStack()
                {
                    ScrollView(.horizontal){
                        Text(value)
                        //Text(finalValue[baseSwitch])
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        //.simultaneousGesture(TapGesture().onEnded {
                        //    numBaseSwitch();
                        //})
                    }
                }
            }
            ScrollView(showsIndicators: false) {
                VStack(){
                ForEach(buttons,id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                self.OnButtonPress(button: button)}){
                                Text(button.rawValue)
                                .frame(width: 36, height: 36)
                                .background(button.backgroundColor)
                                .cornerRadius(11)
                                .padding(.horizontal, 0.1)
                                .padding(.vertical, 0.1)
                            }.buttonStyle(CalcButton()) //Scale Calc Buttonn Style
                        }
                    }   //End of Button (Row) HStack
                }
            }   //End of Button VStack
        }   //End of Scrollview
    } //End of Parent VStack
}//End of BodyView
}//End of content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
