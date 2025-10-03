# ByteCoin 💰

A simple iOS application that fetches real-time Bitcoin exchange rates in different currencies using the CoinAPI.

Um aplicativo iOS simples que busca taxas de câmbio do Bitcoin em tempo real em diferentes moedas usando a CoinAPI.

---

## 🇬🇧 English

### Overview
ByteCoin is an iOS app built with Swift and UIKit that demonstrates how to integrate with a RESTful API to fetch cryptocurrency prices. The main purpose of this project is to showcase API integration in iOS development.

### Features
- Real-time Bitcoin price conversion to 21 different currencies
- Currency selection using UIPickerView
- Clean MVC architecture
- Delegate pattern for communication between components
- JSON parsing and error handling

### Technologies Used
- **Swift**
- **UIKit**
- **URLSession** for networking
- **CoinAPI** for cryptocurrency data
- **Delegate Pattern** for communication

### API Integration

This project uses the [CoinAPI](https://www.coinapi.io/) to fetch real-time Bitcoin exchange rates.

#### How the API Connection Works:

The API integration follows these steps (implemented in `CoinManager.swift`):

1. **Create URL object** - Build the URL string with the base URL, currency parameter, and API key
2. **Create a URLSession** - Initialize a session with default configuration
3. **Create task** - Use `dataTask(with:completionHandler:)` to create an asynchronous network request
4. **Start the task** - Call `task.resume()` to execute the request

```swift
func getCoinPrice(for currency: String) {
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)" // Step 1: Create URL object

    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default) // Step 2: Create a URLSession
        let task = session.dataTask(with: url) { (data, response, error) in // Step 3: Create task
            // Handle response
        }
        task.resume() // Step 4: Start the task
    }
}
```

**API Endpoint:** `https://rest.coinapi.io/v1/exchangerate/BTC/{currency}`

### Project Structure

```
ByteCoin/
├── Model/
│   ├── CoinManager.swift      # Handles API requests and data parsing
│   └── CoinData.swift          # Data model for JSON response
├── View/
│   └── ByteCoinView.swift      # UI components
└── Controller/
    └── ByteCoinViewController.swift  # Main view controller
```

### Supported Currencies
AUD, BRL, CAD, CNY, EUR, GBP, HKD, IDR, ILS, INR, JPY, MXN, NOK, NZD, PLN, RON, RUB, SEK, SGD, USD, ZAR

### How to Run

1. Clone the repository
2. Open `ByteCoin.xcodeproj` in Xcode
3. Build and run the project (Cmd + R)

**Note:** The project includes an API key for demonstration purposes. For production use, you should obtain your own API key from [CoinAPI](https://www.coinapi.io/).

---

## 🇧🇷 Português

### Visão Geral
ByteCoin é um aplicativo iOS construído com Swift e UIKit que demonstra como integrar com uma API RESTful para buscar preços de criptomoedas. O principal propósito deste projeto é mostrar a integração com APIs no desenvolvimento iOS.

### Funcionalidades
- Conversão de preço do Bitcoin em tempo real para 21 moedas diferentes
- Seleção de moeda usando UIPickerView
- Arquitetura MVC limpa
- Padrão Delegate para comunicação entre componentes
- Parsing de JSON e tratamento de erros

### Tecnologias Utilizadas
- **Swift**
- **UIKit**
- **URLSession** para networking
- **CoinAPI** para dados de criptomoedas
- **Padrão Delegate** para comunicação

### Integração com API

Este projeto usa a [CoinAPI](https://www.coinapi.io/) para buscar taxas de câmbio do Bitcoin em tempo real.

#### Como Funciona a Conexão com a API:

A integração com a API segue estes passos (implementados em `CoinManager.swift`):

1. **Criar objeto URL** - Construir a string da URL com a URL base, parâmetro de moeda e chave da API
2. **Criar uma URLSession** - Inicializar uma sessão com configuração padrão
3. **Criar task** - Usar `dataTask(with:completionHandler:)` para criar uma requisição de rede assíncrona
4. **Iniciar a task** - Chamar `task.resume()` para executar a requisição

```swift
func getCoinPrice(for currency: String) {
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)" // Passo 1: Criar objeto URL

    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default) // Passo 2: Criar uma URLSession
        let task = session.dataTask(with: url) { (data, response, error) in // Passo 3: Criar task
            // Tratar resposta
        }
        task.resume() // Passo 4: Iniciar a task
    }
}
```

**Endpoint da API:** `https://rest.coinapi.io/v1/exchangerate/BTC/{moeda}`

### Estrutura do Projeto

```
ByteCoin/
├── Model/
│   ├── CoinManager.swift      # Gerencia requisições à API e parsing de dados
│   └── CoinData.swift          # Modelo de dados para resposta JSON
├── View/
│   └── ByteCoinView.swift      # Componentes de UI
└── Controller/
    └── ByteCoinViewController.swift  # View controller principal
```

### Moedas Suportadas
AUD, BRL, CAD, CNY, EUR, GBP, HKD, IDR, ILS, INR, JPY, MXN, NOK, NZD, PLN, RON, RUB, SEK, SGD, USD, ZAR

### Como Executar

1. Clone o repositório
2. Abra `ByteCoin.xcodeproj` no Xcode
3. Compile e execute o projeto (Cmd + R)

**Nota:** O projeto inclui uma chave de API para fins de demonstração. Para uso em produção, você deve obter sua própria chave da API em [CoinAPI](https://www.coinapi.io/).

---

## 📝 License / Licença

This project is for educational purposes.

Este projeto é para fins educacionais.
