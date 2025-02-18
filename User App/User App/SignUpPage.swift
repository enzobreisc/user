import SwiftUI

struct SignUpPage: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var birthDate: Date = Date()
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var dragOffset: CGFloat = 0
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var profileImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var isDatePickerPresented: Bool = false

    private let maxDrag: CGFloat = 250

    var body: some View {
        NavigationView {
            ZStack {
                // Gradiente de fundo
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.blue.opacity(0.9)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer(minLength: 20)
                    
                    // Área interativa para adicionar foto de perfil
                    Button(action: {
                        isImagePickerPresented.toggle()
                    }) {
                        if let profileImage = profileImage {
                            profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .fill(Color.white.opacity(0.9))
                                .frame(width: 130, height: 130)
                                .overlay(
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)
                                )
                        }
                    }
                    .padding(.bottom, 10)
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImage: $profileImage)
                    }
                    
                    // Campos de entrada com layout harmonioso e sem bordas
                    VStack(spacing: 15) {
                        // Nome completo
                        TextField("Nome completo", text: $name)
                            .font(.system(size: 16))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                        
                        // E-mail
                        TextField("E-mail", text: $email)
                            .font(.system(size: 16))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                        
                        // Nascimento
                        HStack {
                            Text("Nascimento")
                                .font(.system(size: 16))
                                .foregroundColor(.gray.opacity(0.6))
                            Spacer()
                            Button(action: {
                                isDatePickerPresented.toggle()
                            }) {
                                Text("\(birthDate, formatter: dateFormatter)")
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $isDatePickerPresented) {
                                DatePicker("Selecione a data", selection: $birthDate, displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .padding()
                            }
                        }
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                        
                        // Telefone
                        TextField("Telefone", text: $phone)
                            .font(.system(size: 16))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                        
                        // Senha
                        SecureField("Senha", text: $password)
                            .font(.system(size: 16))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                        
                        // Confirmar Senha
                        SecureField("Confirmar Senha", text: $confirmPassword)
                            .font(.system(size: 16))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.clear, lineWidth: 0))
                    }
                    
                    // Botão deslizante para cadastro
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(dragOffset >= maxDrag ? Color.green : Color.blue)
                            .frame(width: 300, height: 60)
                        
                        Text("Arraste para se cadastrar")
                            .font(.system(size: 16, weight: .bold))
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
                                                alertMessage = "Cadastro realizado com sucesso!"
                                            } else {
                                                showAlert = true
                                                alertMessage = "Por favor, preencha todos os campos corretamente."
                                            }
                                        }
                                        dragOffset = 0
                                    }
                            )
                    }
                    .padding(.top, 20)
                    
                    Spacer(minLength: 20)
                }
                .padding(.horizontal)
                .background(Color.white.opacity(0.1))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Aviso"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Text("Voltar")
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        // Implementa a ação de voltar
                        // Isso depende de como você está gerenciando a navegação
                    }
                }
            }
        }
    }
    
    private func validateFields() -> Bool {
        return !name.isEmpty &&
               !email.isEmpty &&
               !phone.isEmpty &&
               !password.isEmpty &&
               (password == confirmPassword)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true)
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
