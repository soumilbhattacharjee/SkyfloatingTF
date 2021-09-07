//
//  SkyFloatingTF.swift
//  SkyfloatingTF
//
//  Created by Soumil on 9/7/21.
//

import SwiftUI

struct SkyFloatingTF: View {
    @State var text: String = ""
    @Environment(\.colorScheme) var colorScheme
    @State var isEditing = false
    @State private var offset: CGFloat = 20.0
    @State private var FloatingLblBGColor = Color.clear
    var tfBGColor: Color?
    
    private var defaultColor : Color {
        if  let color = tfBGColor  {
           return color
        } else {
           return colorScheme == .dark ? Color.black : Color.white
        }
    }
    
    var body: some View {
        ZStack {
            
            TextField("PlaceHolder", text: $text)
                .onChange(of: text, perform: { value in
                    isEditing = !value.isEmpty
                })
                .frame(height: 40)
                .padding(.horizontal, 15)
                .clipShape(Capsule())
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(colorScheme == .dark ? Color.gray : Color.black, style: StrokeStyle(lineWidth: 1.0)))
            if isEditing {
                Text("PlaceHolder")
                    .foregroundColor(colorScheme == .dark ? Color.gray : Color.black)
                    .font(.footnote)
                    .padding(.horizontal, 5)
                    .background(FloatingLblBGColor)
                    .frame(height: 10)
                    .position(x: 55, y: 5)
                    .offset(x: 0.0, y: offset)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                            self.FloatingLblBGColor = defaultColor
                        })
                        withAnimation(.easeOut(duration: 0.4)) { self.offset = 0.0
                        }
                    }

                    .onDisappear {
                        self.offset = 20.0
                        FloatingLblBGColor = Color.clear
                    }
            }
            
        }
        .frame(height: 50)
        //        .padding(10)
        
    }
}

struct SkyFloatingTF_Previews: PreviewProvider {
    static var previews: some View {
        SkyFloatingTF()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
