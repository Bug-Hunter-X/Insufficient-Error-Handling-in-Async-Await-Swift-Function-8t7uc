enum NetworkError: Error {
    case badResponse
    case invalidURL
    case networkError
}

func fetchData() async throws -> Data {
    guard let url = URL(string: "your_valid_url") else {
        throw NetworkError.invalidURL
    }
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse
        }
        return data
    } catch URLError.notConnectedToInternet {
        throw NetworkError.networkError
    } catch {
        print("An unknown error occurred: \(error)")
        throw error
    }
}

//More specific error handling using a custom enum to provide more context to the error.