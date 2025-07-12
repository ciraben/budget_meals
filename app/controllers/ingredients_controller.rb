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
    params.expect(ingredient: [ :price, :quantity, :unit ])
    .tap do |p|
      p[:quantity].to_i.nonzero? || p[:quantity] = 1
    end
  end
end
