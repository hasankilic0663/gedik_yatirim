import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.alwaysBounceHorizontal = false // Yatay kaydırmayı devre dışı bırakıyoruz
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        uiView.load(request)
    }
}

struct WebviewContainer: View {
    @Environment(\.dismiss) var dismiss // dismiss fonksiyonunu eklemek için
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left") // Back simgesi
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding(6)
                            .onTapGesture {
                                dismiss()//butona tıklandıgında dısmıss gelıcek ve kapatılcak burası dismiss olacak yok edılcek
                            }
                    }
                    .modifier(buttonsmall())
                    Spacer()
                }
                .padding(.horizontal)
                
                Webview(url: URL(string: "https://gedik.com/bizi-taniyin/hakkimizda/kvkk-ve-gizlilik-politikamiz")!)
                    .navigationBarBackButtonHidden(true)
                                                    
            }
            .padding(.bottom)
            
            
        }
    }
}

#Preview {
    WebviewContainer()
}
