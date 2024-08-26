//
//  Contracts.swift
//  gedik_yatirim
//
//  Created by Hasan on 21.08.2024.
//

import SwiftUI

struct Contracts: View {
    @State var currentStep : Int = 4
    @State var selectedOption: Bool = false
    @State var selectedOption2: Bool = false
    @State private var isButtonActive = false
    @State var sheetss : Bool = false
    var body: some View {
        ZStack{
            Constants.BackgroundPrimary
                .ignoresSafeArea(.all)
            VStack{
                CustomHeader(title: "Sözleşmeler")
                ExtractedViewBar(currentStep: $currentStep, textaciklama: "Sözleşmeleri okuyup onaylayarak kimlik doğrulama adımına geçebilirsiniz.")
                
                VStack(alignment: .center, spacing: 4) {
                    HStack(alignment: .center, spacing: 16) {
                    
                        Text("Risk Bildirim Formları")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 13)
                        .weight(.semibold)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                            Image( selectedOption ? "Checkboxfill" : "Checkbox") //
                            .onTapGesture {
                                //                                selectedOption.toggle()
                                if selectedOption {
                                    selectedOption = false
                                }
                                else{
                                    sheetss = true
                                }
                            }

                       
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                    .cornerRadius(4)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 340, height: 1)

                        .background(Constants.GreyGrey100)
                    
                        
                    HStack(alignment: .center, spacing: 16) {
                        Text("Kullanıcı Sözleşmeleri")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 13)
                        .weight(.semibold)
                        )
                        .foregroundColor(Constants.LabelColorPrimary)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        Image( selectedOption2 ? "Checkboxfill" : "Checkbox")
                            .onTapGesture {
                                selectedOption2.toggle()
                            }//
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48, alignment: .leading)
                    .cornerRadius(4)
                }
                .padding(.horizontal, 0)

                .padding(.top, 0)

                .padding(.bottom, 4)
                .frame(width: 377, alignment: .center)
                .background(Constants.BackgroundSecondary)
                .cornerRadius(12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(Constants.GreyGrey200, lineWidth: 1)
                )

                Spacer()
               
                NavigationLink(destination:NFCNotFound()) {
                    Text("Devam Et")
                        .modifier(buttonBlueToggleStyle(isToggle: selectedOption && selectedOption2))
                        .padding(.bottom)
                }
                .disabled(!(selectedOption && selectedOption2))
               
                
                
                
                               }
        }
        .sheet(isPresented: $sheetss) {
            SheetViews(isButtonActive: $isButtonActive, selectedOptions: $selectedOption, sheet: $sheetss)
        }
    }
}


struct SheetViews: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isButtonActive: Bool
    @Binding var selectedOptions : Bool
    @Binding var sheet : Bool
    @State private var scrollViewContentHeight: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0
    @State private var isAtBottom: Bool = false

    var body: some View {
        VStack {
            
            Text("Risk Grubu Dışındaki Ürünlerde İşlem")
            .font(
            Font.custom("Plus Jakarta Sans", size: 16)
            .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Constants.LabelColorPrimary)
            .padding(.vertical)
            .padding(.bottom,4)
            
            ZStack {
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Lorem ipsum dolor sit amet consectetur. Gravida ut turpis sollicitudin tellus ipsum vel convallis. Est tincidunt ipsum feugiat pharetra lobortis orci quam. Ullamcorper pellentesque eget nunc lacinia mauris amet. Ac integer odio urna nulla. Purus urna massa volutpat non at odio in lectus. Habitant tellus urna facilisi ut lacus in pellentesque dapibus. Placerat integer diam lobortis nam cras pretium iaculis. Quisque id tempor erat massa. Pellentesque id mi in feugiat. Nunc cursus lacus donec libero lacus. Quam eget varius sodales vitae turpis volutpat tincidunt. Vehicula at quis sed a faucibus quis nibh placerat dictum.\nId vel tellus nec leo cras aenean magna. Elementum euismod bibendum massa aliquam penatibus lorem ultricies. Volutpat vulputate nec vitae enim. Adipiscing in nulla malesuada at velit enim. Blandit cras purus massa feugiat imperdiet odio mauris sollicitudin eleifend.\nQuis sed neque vulputate sed blandit amet commodo nulla phasellus. Dolor suscipit curabitur commodo sit elementum. Turpis dignissim pellentesque pellentesque mattis eu integer quam cursus sed. Elit quis dictum quam ullamcorper nunc nulla neque aliquet. Vestibulum lacus convallis enim est pretium et pellentesque lectus at. Laoreet elit consectetur nunc lacus ultsollicitudin eleifend.\nQuis sed neque vulputate sed blandit amet commodo nulla phasellus. Dolor suscipit curabitur commodo sit elementum. Turpis dignissim pellentesque pellentesque mattis eu integer quam cursus sed. Elit quis dictum quam ullamcorper nunc nulla neque aliquet. Vestibulum lacus convallis enim est pretium et pellentesque lectus at. Laoreet elit consectetur nunc lacus ultrices. Facilisis adipiscing enim amet vulputate ut. Urna sit tempus quis senectus lacus eu urna nam. Accumsan ornare cras amet vestibulum neque fames placerat eget.\nSed blandit nunc habitant at faucibus proin pretium. Amet lorem ornare iaculis scelerisque nisl vitae at fringilla. Sed in mattis fames eget congue. Habitant eget nulla dui neque donec aliquam risus fringilla urna. Tristique urna lectus morbi maecenas morbi lobortis mauris. Mattis molestie aliquam sagittis mauris elementum integer varius neque. Amet hac commodo urna scelerisque mollis bibendum donec. Amet integer a aliquam amet magna posuere sit. Proin nisi auctor rhoncus nisi.\nElementum dolor nec amet ultricies euismod libero malesuada et. Nibh ametrices. Facilisis adipiscing enim amet vulputate ut. Urna sit tempus quis senectus lacus eu urna nam. Accumsan ornare cras amet vestibulum neque fames placerat eget.\nSed blandit nunc habitant at faucibus proin pretium. Amet lorem ornare iaculis scelerisque nisl vitae at fringilla. Sed in mattis fames eget congue. Habitant eget nulla dui neque donec aliquam risus fringilla urna. Tristique urna lectus morbi maecenas morbi lobortis mauris. Mattis molestie aliquam sagittis mauris elementum integer varius neque. Amet hac commodo urna scelerisque mollis bibendum donec. Amet integer a aliquam amet magna posuere sit. Proin nisi auctor rhoncus nisi.\nElementum dolor nec amet ultricies euismod libero malesuada et. Nibh amet dignissim sit ac tristique mollis id tellus id. Dolor sem vitae metus mi sapien laoreet. Pellentesque ornare felis et non curabitur. Accumsan enim donec purus quis euismod lectus urna vel ut.")
                            .font(
                            Font.custom("Plus Jakarta Sans", size: 14)
                            .weight(.medium)
                            )
                            .foregroundColor(Constants.LabelColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
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
//                                .padding()
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
                VStack{
                    // Mavi kutu
                    Spacer()
                    if isButtonActive {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Constants.FillColorFillColor600)
//                            .frame(width: 200, height: 100)
//                            .overlay(
//                                                            Text("Mavi Kutu İçinde Yazı")
//                                                                .foregroundColor(.white)
//                                                                .font(.headline)
//                                                        )
//                            .transition(.opacity) // Smooth disappearance
//                            .padding(.bottom,24)
                        HStack(alignment: .center, spacing: 0) {
                            Text("Sözleşmeyi okumak ve onaylamak için aşağı kaydırın")
                            .font(
                            Font.custom("Plus Jakarta Sans", size: 11)
                            .weight(.semibold)
                            )
                            .foregroundColor(Constants.ShadesWhite)
                            .frame(width: 164, alignment: .topLeading)
                            
                            Image("down")
                            .frame(width: 24, height: 24)
                        }

                        .padding(12)
                        .background(Constants.FillColorFillColor600)
                        .cornerRadius(8)
                    }
                }
                .padding(.bottom)
            }
            
            Spacer()
            
            Button(action: {
                sheet = false
                selectedOptions = true
            }) {
                Text("Onaylıyorum")
                    .padding()
                    .frame(width: 300, height: 50) // Frame ayarları
                    .background(!isButtonActive ? Constants.FillColorFillColor600 : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isButtonActive)
            
        }
        .presentationDetents([.height(600)]) // Sheet yüksekliğini orta boyutta tutar
        .presentationDragIndicator(.hidden)
        .padding(.horizontal)
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
#Preview {
    Contracts()
}
