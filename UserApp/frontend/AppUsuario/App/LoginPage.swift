import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isDragging: Bool = false
    @State private var dragOffset: CGSize = .zero
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            // Logo do aplicativo
            Image(systemName: "app.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            // Frase de explicação básica
            Text("Bem-vindo de volta! Faça login para continuar.")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(.horizontal, 32)
            
            // Campos de entrada
            Group {
                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    .padding(.horizontal, 32)
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    .padding(.horizontal, 32)
            }
            .padding(.bottom, 20)
            
            // Animação de arrastar para iniciar sessão
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: 50)
                
                Text("Iniciar Sessão")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(isDragging ? Color.green : Color.blue)
                            .frame(width: 50, height: 50)
                            .offset(x: dragOffset.width)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        isDragging = true
                                        dragOffset.width = min(max(gesture.translation.width, 0), UIScreen.main.bounds.width - 100)
                                    }
                                    .onEnded { _ in
                                        if dragOffset.width > UIScreen.main.bounds.width - 150 {
                                            // Validação dos campos
                                            if validateFields() {
                                                // Ação para iniciar a sessão
                                                showAlert = true
                                                alertMessage = "Login realizado com sucesso!"
                                                dragOffset.width = UIScreen.main.bounds.width - 100
                                            } else {
                                                showAlert = true
                                                alertMessage = "Por favor, preencha todos os campos corretamente."
                                                dragOffset = .zero
                                            }
                                        } else {
                                            dragOffset = .zero
                                        }
                                        isDragging = false
                                    }
                            )
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 16)
                }
            }
            .padding(.bottom, 50)
            
            Spacer()
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sucesso"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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