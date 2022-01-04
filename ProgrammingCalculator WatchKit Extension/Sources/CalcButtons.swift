//
//  CalcButtons.swift
//  Calculator WatchKit Extension
//
//  Created by Austin Wright on 12/18/21.
//

import WatchKit
import Foundation
import SwiftUI

//Calculator Button Enumeration
//Here I defined the buttons and cases for colors
//Colors cannot be adjusted in systems settings. Add system settings color support
enum CalculatorButton: String{
    
case A = "A"
case B = "B"
case C = "C"
case D = "D"
case E = "E"
case F = "F"
case Zero = "0"
case One = "1"
case Two = "2"
case Three = "3"
case Four = "4"
case Five = "5"
case Six = "6"
case Seven = "7"
case Eight = "8"
case Nine = "9"
case BFlip = "BF"
case AC = "AC"
case AND = "AND"
case OR = "OR"
case XOR = "XOR"
case Div = "÷"
case Mult = "×"
case Add = "+"
case Subt = "-"
case LShift = "<<"
case RShift = ">>"
case Twos = "2's"
case Ones = "1's"
case Equal = "="
case LPar = "("
case RPar = ")"
    
var backgroundColor:Color{
    switch self{
    case .AC,.AND,.OR,.XOR,.Div,.Mult,.Equal,.BFlip,.Add,.Subt,.Ones,.Twos,.LShift,.RShift:
            return Color(.darkGray)
    case        .Zero,.One,.Two,.Three,.Four,.Five,.Six,.Seven,.Eight,.Nine,.LPar,.RPar:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

//Operator Enumeration
enum Operation{
    case Add, Subt, Mult, Div, AND, OR, XOR, LShift, RShift, BFlip, None
}


struct CalcButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
