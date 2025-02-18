import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var dragOffset: CGFloat = 0
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    private let maxDrag: CGFloat = 250 // Definindo o valor máximo de arrasto
    
    var body: some View {
        NavigationView {
            ZStack {
                // Gradiente de fundo
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.blue.opacity(0.9)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all) // Ajuste para ignorar a SafeArea
                
                VStack {
                    Spacer()
                    
                    // Logo do aplicativo
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .padding(.vertical, 80)
                        .foregroundColor(.white)
                 
                    // Campos de entrada
                    Group {
                        TextField("E-mail", text: $email)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                            .padding()
                            .frame(width: 300)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                        
                        SecureField("Senha", text: $password)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                            .padding()
                            .frame(width: 300)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.bottom, 20)
                    
                    // Animação de arrastar para iniciar sessão
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(dragOffset >= maxDrag ? Color.green : Color.white)
                            .frame(width: 300, height: 60)
                            .shadow(radius: 5)
                        
                        Text("Arraste para entrar")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 60)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(25)
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                            .offset(x: dragOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        let newOffset = min(max(gesture.translation.width, 0), maxDrag)
                                        dragOffset = newOffset
                                    }
                                    .onEnded { _ in
                                        if dragOffset >= maxDrag {
                                            if validateFields() {
                                                showAlert = true
                                                alertMessage = "Login realizado com sucesso!"
                                            } else {
                                                showAlert = true
                                                alertMessage = "Por favor, preencha todos os campos corretamente."
                                            }
                                        }
                                        dragOffset = 0
                                    }
                            )
                    }
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Aviso"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    func validateFields() -> Bool {
        // Validação do e-mail
        guard email.contains("@") && email.contains(".") else { return false }
        
        // Validação da senha
        guard !password.isEmpty else { return false }
        
        return true
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
