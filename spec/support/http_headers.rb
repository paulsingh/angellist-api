module HttpHeaders
  # Faraday response headers are wrapped with a utility Hash subclass that
  # normalizes case, underscored Symbols, etc.
  def headerize(hash)
    Faraday::Utils::Headers.new(hash)
  end
end

