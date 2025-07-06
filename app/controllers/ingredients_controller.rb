class IngredientsController < ApplicationController
  before_action :get_the_ingredient, only: %i[ edit update ]

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to root_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def ingredient_params
    params.expect(ingredient: [ :price_per_unit, :unit ])
  end

  def get_the_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
