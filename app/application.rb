require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?('/items/')
      @@items.each do |item|
        if item.name == req.path.split('/items/').last
          resp.write "#{item.price}"
        end
      end
      if resp.empty?
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
