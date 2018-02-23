class Dishes < Sinatra::Base
  get "/" do 
    erb :home 
  end
  
  post "/dishes" do 
    Food.create(title: params[:title], description: params[:description])
    redirect "/"
  end 

  post "/dishes" do 
    @dishes = Food.all
    erb :dishes 
  end

   get "/dishes/:id/edit" do 
    @dish = Dish.find(params[:id]) 
    erb :edit 
  end 
  put "/dishes/:id" do
    app = Dish.find(params[:id])
    app.update(title: params[:title], description: params[:description])
  redirect "/dishes"
  end

  delete "/dishes/:id" do
  Dish.find(params[:id]).destroy
  redirect "/dishes"
end

end 

