class Application

@@items = ["Apples", 2.50, "Bananas", 1.75, "Oranges", 1.25]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)


      if req.path.match(/items/)
        item_name = req.path.split("/items/").last

      if  item = @@items.find {|i| i.name == item_name}
          resp.write item.price

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

# if req.path.match(/songs/)
#
#     song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
#     song = @@songs.find{|s| s.title == song_title}
#
#     resp.write song.artist
#   end
