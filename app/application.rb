class Application

    @@items = []

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        # @@items.each do |item|
        #     resp.write "#{item.name}\n"
        # end

        if req.path.match(/items/)
            request_item = req.path.split("/items/").last
            item_found = @@items.find {|item| item.name == request_item}
            if item_found
              #item = @@items.find{|item| item == request_item}
            #  resp.status = 200
              resp.write item_found.price
            else
              resp.status = 400
              resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end
