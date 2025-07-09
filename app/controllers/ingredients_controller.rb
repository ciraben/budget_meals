class IngredientsController < ApplicationController
  def update
    @ingredient = Ingredient.find(params[:id])

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
end
