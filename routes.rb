class Dishes < Sinatra::Base
  get "/" do 
    erb :home 
  end
  
get "/dishes/new" do 
  erb :new 
end 

  get "/dishes/:id/edit" do 
  @dish = Dish.find(params[:id]) 
    erb :edit 
  end 


  get "/dishes" do 
    @dishes = Dish.all
    erb :dishes 
  end

  get "/.dishes" do 
    @dishes = Dish.all
    erb :dishes
    end 
  put "/dishes/:id" do
    dish = Dish.find(params[:id])
    dish.update(
      title: params[:title], description: params[:description]
      )
  redirect "/dishes"
  end
  
  post "/dishes" do 
    Dish.create(title: params[:title], description: params[:description])
    redirect "/"
  end 


  delete "/dishes/:id" do
  Dish.find(params[:id]).destroy
  redirect "/dishes"
end

end 

