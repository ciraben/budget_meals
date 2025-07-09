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

  def safe_params
    params.expect(ingredient: [ :price, :per, :unit ])
  end

  def ingredient_params
    {
      price_per_unit: safe_params[:price].to_d / safe_params[:per].to_d,
      unit: safe_params[:unit]
    }
  end
end
