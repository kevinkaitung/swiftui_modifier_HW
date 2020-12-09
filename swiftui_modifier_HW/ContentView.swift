//
//  ContentView.swift
//  swiftui_modifier_HW
//
//  Created by User18 on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    var imgData = ["backDeleteDora", "doraemon13", "doraemon14", "doraemon18"]
    @State private var imgIndex: CGFloat = 0
    
    @State private var rColor: Double = 0
    @State private var gColor: Double = 0
    @State private var bColor: Double = 0
    @State private var oColor: Double = 0.1
    
    @State private var changeBgColorMode: CGFloat = 0
    @State private var colorGradient: Double = 0
    @State private var angle: CGFloat = 0
    @State private var edge: CGFloat = 0
    @State private var shadow: CGFloat = 0
    
    @State private var blur: CGFloat = 0
    @State private var brightness: CGFloat = 0
    @State private var colorMultiIndex: CGFloat = 0
    @State private var colorContra: Double = 1
    
    @State private var grayScl: Double = 0
    @State private var colorHueRota: Double = 0
    @State private var colorSaturation: Double = 1
    @State private var imgRotate: Double = 0
    
    func colorMul(index: CGFloat) -> Color {
        if index == 0 {
            return .white
        }
        else if index == 1 {
            return .red
        }
        else if index == 2 {
            return .green
        }
        else if index == 3 {
            return .blue
        }
        return .white
    }
    
    func randomModifier() {
        imgIndex = CGFloat(Int.random(in: 0...3))
        rColor = Double.random(in: 0...1)
        gColor = Double.random(in: 0...1)
        bColor = Double.random(in: 0...1)
        oColor = Double.random(in: 0...1)
        changeBgColorMode = CGFloat(Int.random(in: 0...1))
        colorGradient = Double.random(in: 0...1)
        angle = CGFloat(20 * Int.random(in: 0...6))
        edge = CGFloat(Int.random(in: 0...5))
        shadow = CGFloat(2 * Int.random(in: 0...10))
        blur = CGFloat(Int.random(in: 0...5))
        brightness = CGFloat.random(in: 0...1)
        colorMultiIndex = CGFloat(Int.random(in: 0...3))
        colorContra = Double.random(in: 0...4.5)
        grayScl = Double.random(in: 0...1)
        colorHueRota = Double.random(in: 0...359)
        colorSaturation = Double.random(in: 0...10)
        imgRotate = Double.random(in: 0...359)
    }
    
    
    func initialModifier() {
        imgIndex = 0
        rColor = 0
        gColor = 0
        bColor = 0
        oColor = 0.1
        changeBgColorMode = 0
        colorGradient = 0
        angle = 0
        edge = 0
        shadow = 0
        blur = 0
        brightness = 0
        colorMultiIndex = 0
        colorContra = 1
        grayScl = 0
        colorHueRota = 0
        colorSaturation = 1
        imgRotate = 0
    }
    
    
    var body: some View {
        VStack {
            ZStack {
                Image("bg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 275, height: 183)
                    .opacity(0.4)
                    .border(Color.black, width: edge)
                    .cornerRadius(angle)
                if(changeBgColorMode == 0)
                {
                    Color(red: rColor, green: gColor, blue: bColor, opacity: oColor)
                        .frame(width: 150, height: 150)
                }
                else
                {
                    Color(red: 0, green: 0, blue: 0, opacity: 0)
                        .frame(width: 150, height: 150)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 2 - colorGradient, green: 165/255, blue: 0), Color(red: 0, green: 0, blue: colorGradient + 1)]), startPoint: .leading, endPoint: .trailing))
                    
                }
                Image(imgData[Int(imgIndex)])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(3.0)
                    .shadow(radius: shadow)
                    .blur(radius: blur)
                    .brightness(Double(brightness))
                    .colorMultiply(self.colorMul(index: colorMultiIndex))
                    .contrast(colorContra)
                    .grayscale(grayScl)
                    .hueRotation(Angle(degrees: colorHueRota))
                    .saturation(colorSaturation)
                    .rotationEffect(Angle(degrees: imgRotate))
            }
            ScrollView {
                Group {
                    HStack {
                        Text("Image Number:\(Int(imgIndex+1))")
                        Slider(value: $imgIndex, in: 0...3, step: 1)
                    }
                    HStack {
                        Text("Red:\(rColor, specifier: "%.2f")")
                        Slider(value: $rColor, in: 0...1)
                    }
                    HStack {
                        Text("Green:\(gColor, specifier: "%.2f")")
                        Slider(value: $gColor, in: 0...1)
                    }
                    HStack {
                        Text("Blue:\(bColor, specifier: "%.2f")")
                        Slider(value: $bColor, in: 0...1)
                    }
                    HStack {
                        Text("Opacity:\(oColor, specifier: "%.2f")")
                        Slider(value: $oColor, in: 0...1)
                    }
                    HStack {
                        Text("Background Color Mode:\(Int(changeBgColorMode))")
                        Slider(value: $changeBgColorMode, in: 0...1, step: 1)
                    }
                    HStack {
                        Text("Gradient Ratio:\(colorGradient, specifier: "%.2f")")
                        Slider(value: $colorGradient, in: 0...1)
                    }
                    HStack {
                        Text("Corner Radius:\(Int(angle))")
                        Slider(value: $angle, in: 0...120, step: 20)
                    }
                    HStack {
                        Text("Edge width:\(Int(edge))")
                        Slider(value: $edge, in: 0...5, step: 1)
                    }
                    HStack {
                        Text("Shadow:\(Int(shadow))")
                        Slider(value: $shadow, in: 0...20, step: 2)
                    }
                }
                Group {
                    HStack {
                        Text("Blur:\(Int(blur))")
                        Slider(value: $blur, in: 0...5, step: 1)
                    }
                    HStack {
                        Text("Brightness:\(Double(brightness), specifier: "%.2f")")
                        Slider(value: $brightness, in: 0...1)
                    }
                    HStack {
                        Text("Color Multiply:\(Int(colorMultiIndex))")
                        Slider(value: $colorMultiIndex, in: 0...3, step: 1)
                        
                    }
                    HStack {
                        Text("Contrast:\(colorContra, specifier: "%.2f")")
                        Slider(value: $colorContra, in: 0...4.5)
                    }
                    HStack {
                        Text("Gray Scale:\(grayScl, specifier: "%.2f")")
                        Slider(value: $grayScl, in: 0...1)
                    }
                    HStack {
                        Text("HueRotation:\(colorHueRota, specifier: "%.2f")")
                        Slider(value: $colorHueRota, in: 0...359)
                    }
                    HStack {
                        Text("Saturation:\(colorSaturation, specifier: "%.2f")")
                        Slider(value: $colorSaturation, in: 0...10)
                    }
                    HStack {
                        Text("Rotation:\(imgRotate, specifier: "%.2f")")
                        Slider(value: $imgRotate, in: 0...359)
                    }
                }
                Group {
                    Button("Random") {
                        randomModifier()
                    }
                    Button("Intial")
                    {
                        initialModifier()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
