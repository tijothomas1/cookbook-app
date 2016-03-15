class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    if params[:sort] && params[:sort_order]
      @recipes = @recipes.order(params[:sort] => params[:sort_order])
    end

    # discount is just a made up name for this thing
    if params[:discount]
      @recipes = @recipes.where("price < ?", params[:discount])
    end
  end

  def show
    # @recipe = Recipe.find_by(id: params[:id])
    @recipe = Recipe.find(params[:id])

    @ingredient_list = @recipe.ingredient_list
    @directions_list = @recipe.directions_list
  end

  def new
    
  end

  def create
    @recipe = Recipe.create({
                              title: params[:title],
                              chef: params[:chef],
                              ingredients: params[:ingredients],
                              directions: params[:directions]
                            })

      flash[:success] = "New Recipe Created"
  
    redirect_to "/recipes/#{@recipe.id}"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update({
                    title: params[:title],
                    chef: params[:chef],
                    ingredients: params[:ingredients],
                    directions: params[:directions]
                  })
  
    flash[:success] = "New Recipe Updated"

    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    flash[:success] = "You did such a great job destroying that recipe."
    flash[:warning] = "Recipe Destroyed!"

    redirect_to "/"
  end

  def random
    # .sample returns 1 randomly selected item in the array
    @recipe = Recipe.all.sample

    # instead of showing this view render a random show view
    render :show
  end

  def search
    # this is fuzzy logic that is combining SQL and rails; the params search part replaces the ? after LIKE. This searchs both the title and the ingredients for what you type in the search field.
    @recipes = Recipe.where("title LIKE ? OR ingredients LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

    # this is so that you don't have multiple "index" pages
    render :index
  end

end