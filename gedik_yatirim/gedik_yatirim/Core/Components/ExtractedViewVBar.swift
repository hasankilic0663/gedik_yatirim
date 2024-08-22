import SwiftUI
struct ExtractedViewBar: View {
    @Binding var currentStep: Int
    @State var totalSteps : Int = 5
    var textaciklama : String
    var body: some View {
        VStack{
            HStack(alignment: .center,spacing: 2) {
                ForEach(1...totalSteps, id: \.self) { step in
                    Rectangle()
                        .fill(step <= currentStep ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 36, height: 5, alignment: .leading)
                        .cornerRadius(2.5)
                    //                                        .padding(.horizontal,0)
                }
            }
            .padding()
            
            Text("\(currentStep)/\(totalSteps)")
                .font(
                    Font.custom("Plus Jakarta Sans", size: 17)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.FillColorFillColor600)
            
            Text(textaciklama)
                .font(
                    Font.custom("Plus Jakarta Sans", size: 15)
                        .weight(.semibold)
                )
                .fixedSize(horizontal: false, vertical: true) // Metni dikeyde sabitler, yatayda taşma yapmaz
                .frame(width: 345, alignment: .top)
                    .multilineTextAlignment(.center)
                    .padding()
//                .padding(.vertical,3)
            
        }
        .padding(.bottom)
    }
}
