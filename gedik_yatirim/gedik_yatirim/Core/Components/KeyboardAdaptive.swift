import SwiftUI
import Combine
import UIKit

// Klavye yüksekliğini izlemek için Publisher
struct KeyboardHeightPublisher: Publisher {
    typealias Output = CGFloat
    typealias Failure = Never

    func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Failure, S.Input == Output {
        let subscription = KeyboardHeightSubscription(subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }

    private class KeyboardHeightSubscription<S: Subscriber>: Subscription where S.Input == CGFloat {
        private var subscriber: S?
        private var notificationCenter: NotificationCenter = NotificationCenter.default

        init(subscriber: S) {
            self.subscriber = subscriber
            self.notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        }

        @objc private func keyboardWillChangeFrame(_ notification: Notification) {
            if let userInfo = notification.userInfo,
               let keyboardFrameEnd = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                let height = keyboardFrameEnd.height
                _ = subscriber?.receive(height)
            }
        }

        func request(_ demand: Subscribers.Demand) {}

        func cancel() {
            self.subscriber = nil
            self.notificationCenter.removeObserver(self)
        }
    }

    static var keyboardHeight: KeyboardHeightPublisher {
        KeyboardHeightPublisher()
    }
}

// Klavye yüksekliğine göre padding ekleyen ViewModifier
struct KeyboardAdaptiveModifier: ViewModifier {
    @StateObject private var keyboardObserver = KeyboardObserver() // Burada @StateObject kullanıyoruz

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardObserver.keyboardHeight)
            .onReceive(KeyboardHeightPublisher.keyboardHeight) { height in
                withAnimation {
                    self.keyboardObserver.keyboardHeight = height
                }
            }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        self.modifier(KeyboardAdaptiveModifier())
    }
}

// Klavye yüksekliğini izleyen bir ObservableObject
class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
}
