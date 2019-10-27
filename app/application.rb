class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.empty?
<<<<<<< HEAD
        resp.write "Your cart is empty"
      else 
        @@cart.each do |cart_item|
          resp.write "#{cart_item}\n"
        end
      end
    elsif req.path.match(/add/)
      item_add = req.GET["item"]
      if @@items.include?(item_add)
        @@cart << item_add
        resp.write "added #{item_add}"
      else
        resp.write "We don't have that item"
      end
=======
        
        @@cart.each do |cart_item|
        resp.write "#{cart_item}\n"
      end 
>>>>>>> c008f7f3115eb8c708aa65385b254c896822fd99
    
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
