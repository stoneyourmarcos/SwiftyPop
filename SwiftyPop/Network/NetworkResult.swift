// MARK: - Error
enum NetworkResult: Int, CustomStringConvertible, Swift.Error {
    case unknown = 0
    case linkError = 1
    case failToParseResponse = 2
    
    var description: String {
        switch self {
        case .unknown:
            return "Erro desconhecido"
        case .linkError:
            return "Falha de conexão, tente novamente"
        case .failToParseResponse:
            return "Falha ao parsear a resposta"
        }
    }
}
