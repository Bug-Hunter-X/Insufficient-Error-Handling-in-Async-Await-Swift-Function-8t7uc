func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw NetworkError.badResponse
    }
    return data
}

//This code might throw an error if the URL is invalid or if the network is unavailable. The error handling is minimal and can be improved by providing more specific error messages.