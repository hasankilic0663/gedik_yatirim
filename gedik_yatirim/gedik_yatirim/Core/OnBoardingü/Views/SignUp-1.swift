import SwiftUI

struct SignUp_1: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SignUp_1ViewViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    CustomHeader()

                    Image("Logo")
                        .padding(.top, 41)

                    Text("Cep Telefonu Numaranızı Giriniz.")
                        .modifier(gedik_text_black())
                        .padding(10)
                        .frame(height: 64, alignment: .center)

                    HStack {
                        HStack {
                            VStack {
                                Text("Alan Kodu")
                                    .modifier(textFieldTitle())
                                HStack {
                                    Image("emojione_flag-for-turkey")
                                    Text("+90")
                                        .font(
                                            Font.custom("Plus Jakarta Sans", size: 13)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Constants.LabelColorSecondary)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                            }
                            Button {} label: {
                                Image("chevron-down")
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(width: 116, height: 58, alignment: .center)
                        .background(Constants.BackgroundTertiary)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        )
                        .padding(.leading)

                        VStack {
                            Text("Telefon Numarası")
                                .modifier(textFieldTitle())
                            TextField("Telefon Numaranızı Giriniz", text: $viewModel.phoneNumber)
                                .modifier(textFieldText())
                                .font(
                                    Font.custom("Plus Jakarta Sans", size: 14)
                                        .weight(.medium)
                                )
                                .foregroundColor(Constants.LabelColorPrimary)
                                .keyboardType(.numberPad)
                                .onChange(of: viewModel.phoneNumber) { _ in
                                    viewModel.filter()
                                }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .topLeading)
                        .background(Constants.BackgroundTertiary)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Constants.GreyGrey300, lineWidth: 1)
                        )
                        .padding(.trailing)
                    }

                    Spacer()

                    NavigationLink(destination: SignUp_1_2(phoneNumber: $viewModel.phoneNumber), isActive: $viewModel.isNavigationActive) {
                        Button {
                            
                            viewModel.SignUp()
                        } label: {
                            Text("Devam Et")
                                .modifier(buttonBlue())
                        }
                    }
                }
                // Özelleştirilmiş Alert
                if viewModel.showAlert {
                    CustomAlertView(viewModel: viewModel)
                    
                }
            }
            .background(Constants.BackgroundPrimary)
            .onTapGesture {
                // Klavyeyi kapat
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }

            
        }
    }
}

struct CustomAlertView: View {
    @ObservedObject var viewModel: SignUp_1ViewViewModel

    var body: some View {
        
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 13) {
                Text("Uyarı")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top,12)

                Text(viewModel.alertMessage)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    viewModel.showAlert = false
                }) {
                    Text("TAMAM")
                        .modifier(buttonBlueSheet())
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .frame(maxWidth: 350)
            .padding()
        
    }
}

#Preview {
   SignUp_1()
}
