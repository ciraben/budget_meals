module MealsHelper
  def format_quantity(qty)
    qty.to_r.denominator == 1 ? qty.to_i : qty.to_r
  end
end
