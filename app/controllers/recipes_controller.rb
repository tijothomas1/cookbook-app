class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
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
  
    redirect_to "/"
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



end