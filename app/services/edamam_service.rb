class EdamamService
  def self.conn
    Faraday.new(
      url: "https://api.edamam.com/api/recipes/v2",
      params: {
        type: 'public',
        app_id: ENV['edamam_id'],
        app_key: ENV['edamam_key']
      },
      headers: {'Content-Type' => 'application/json'}
    )
  end
  
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.recipe_name(search)
    JSON.parse(conn.get { |req| req.params[:q] = search_term }.body, symbolize_names: true)
  end
  
end