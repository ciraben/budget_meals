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
    .tap do |p|
      p[:price] = p[:price].to_d
      p[:per] = p[:per].to_d
      p[:per].nonzero? || p[:per] = 1
    end
  end

  def ingredient_params
    {
      price_per_unit: safe_params[:price] / safe_params[:per],
      unit: safe_params[:unit]
    }
  end
end
