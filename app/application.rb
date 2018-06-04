class Application

  @@items = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # binding.pry
    item_name = req.path.split("/").last
 
    if req.path=="/items/#{item_name}"
      resp.write "You requested the songs"
      @@items.find do |item|
        if item.name == item_name
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
        end
        # binding.pry
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end