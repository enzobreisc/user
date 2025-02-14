import SwiftUI

struct PaymentPage: View {
    @State private var selectedPaymentMethod: String = "Cartão de Crédito"
    @State private var cardNumber: String = ""
    @State private var cardExpiry: String = ""
    @State private var cardCVV: String = ""
    @State private var saldoAtual: Double = 100.0 // Exemplo de saldo atual
    @State private var historicoCompras: [Compra] = [
        Compra(id: "1", descricao: "Imersão 1", valor: 29.99, data: "01/10/2023"),
        Compra(id: "2", descricao: "Imersão 2", valor: 19.99, data: "15/09/2023")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Adicionar Saldo
                VStack(alignment: .leading, spacing: 10) {
                    Text("Adicionar Saldo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Picker("Método de Pagamento", selection: $selectedPaymentMethod) {
                        Text("Cartão de Crédito").tag("Cartão de Crédito")
                        Text("PayPal").tag("PayPal")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.vertical)
                    
                    if selectedPaymentMethod == "Cartão de Crédito" {
                        TextField("Número do Cartão", text: $cardNumber)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                            .padding(.bottom, 10)
                        
                        HStack {
                            TextField("Validade (MM/AA)", text: $cardExpiry)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                            
                            TextField("CVV", text: $cardCVV)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    } else if selectedPaymentMethod == "PayPal" {
                        Text("Você será redirecionado para o PayPal para completar a compra.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.vertical)
                    }
                    
                    Button(action: {
                        // Ação para adicionar saldo
                    }) {
                        Text("Adicionar Saldo")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                
                // Saldo Atual
                VStack(alignment: .leading, spacing: 10) {
                    Text("Saldo Atual")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("R$ \(saldoAtual, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                
                // Histórico de Compras
                VStack(alignment: .leading, spacing: 10) {
                    Text("Histórico de Compras")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(historicoCompras) { compra in
                        VStack(alignment: .leading) {
                            Text(compra.descricao)
                                .font(.headline)
                            Text("R$ \(compra.valor, specifier: "%.2f") - \(compra.data)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                        .padding(.bottom, 10)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                
                // Configurações de Pagamento
                VStack(alignment: .leading, spacing: 10) {
                    Text("Configurações de Pagamento")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        // Ação para adicionar novo método de pagamento
                    }) {
                        Text("Adicionar Novo Método de Pagamento")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.top, 10)
                    
                    Button(action: {
                        // Ação para remover método de pagamento
                    }) {
                        Text("Remover Método de Pagamento")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            }
            .padding()
        }
        .navigationTitle("Pagamento")
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct Compra: Identifiable {
    var id: String
    var descricao: String
    var valor: Double
    var data: String
}

struct PaymentPage_Previews: PreviewProvider {
    static var previews: some View {
        PaymentPage()
    }
}