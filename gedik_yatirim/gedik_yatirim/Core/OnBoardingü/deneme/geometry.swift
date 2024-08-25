import SwiftUI

struct Geometry: View {
    @State private var isSheetPresented = false
    @State private var isButtonActive = false

    var body: some View {
        Button("Show Sheet") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetView(isButtonActive: $isButtonActive)
        }
    }
}

struct SheetView: View {
    @Binding var isButtonActive: Bool
    @State private var scrollViewContentHeight: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0
    @State private var isAtBottom: Bool = false

    var body: some View {
        VStack {
            ZStack {
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın... Buraya uzun bir metin yazın...")
                                .padding()
                                .background(GeometryReader { geometry in
                                    Color.clear
                                        .onChange(of: geometry.size.height) { newHeight in
                                            self.scrollViewContentHeight = newHeight
                                            updateButtonStatus()
                                        }
                                        .onChange(of: geometry.frame(in: .global).maxY) { newOffset in
                                            self.scrollViewHeight = newOffset
                                            updateButtonStatus()
                                        }
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                    }
                    .background(GeometryReader { geometry in
                        Color.clear
                            .onChange(of: geometry.size.height) { newHeight in
                                self.scrollViewHeight = newHeight
                                updateButtonStatus()
                            }
                    })
                }

                // Mavi kutu
                if isButtonActive {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .padding()
                        .transition(.opacity) // Smooth disappearance
                }
            }
            
            Spacer()
            
            Button(action: {
                // Button action
            }) {
                Text("Continue")
                    .padding()
                    .background(!isButtonActive ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isButtonActive)
            .padding()
        }
        .padding()
    }
    
    private func updateButtonStatus() {
        // Calculate if scrollView is scrolled to the bottom
        if scrollViewContentHeight <= scrollViewHeight {
            withAnimation {
                isButtonActive = true
            }
        } else {
            withAnimation {
                isButtonActive = false
            }
        }
    }
}

struct Geometry_Previews: PreviewProvider {
    static var previews: some View {
        Geometry()
    }
}
