import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Вход")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct LoginView: View {
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 64) {
            HeaderView()
            
            VStack(spacing: 32) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                VStack(spacing: 16) {
                    TextField("Логин", text: $login)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.white)
                        .cornerRadius(16)
                    SecureField("Пароль", text: $password)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.white)
                        .cornerRadius(16)
                }
                Button(action: {
                    // Запрос к апи тут будет
                    print("Логин: \(login)")
                    print("Пароль: \(password)")
                }, label: {
                    Text("Войти")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.teal)
                        .cornerRadius(16)
                        .foregroundStyle(.white)
                        .font(.headline)
                        
                })
            }
            .padding(32)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(16)
            
            FooterView()
        }
        .padding()
        
    }
}

struct ContentView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    
    var body: some View {
        LoginView(login: $login, password: $password)
    }
}

struct FooterView: View {
    var body: some View {
        Text("Версия приложения: 0.1 Пре-альфа")
            .font(.footnote)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
}
