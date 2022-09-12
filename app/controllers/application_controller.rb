class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do 
    bakery = Bakery.all 
    #returns an array of JSON objects for all bakeries in the database
    bakery.to_json
  end

  get '/bakeries/:id' do
    # returns a single bakery as JSON with its baked goods nested
    bakery = Bakery.find(params[:id])
    bakery.to_json({include: :baked_goods})
  end

  get '/baked_goods/by_price' do
    # see the class for the method 
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # see the class for the method
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end
end
