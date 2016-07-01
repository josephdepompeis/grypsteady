class CartItem < ActiveRecord::Base
  belongs_to :cart
  has_many :designs
  belongs_to :receipt

  def create_cart_item_from_design(design_properties)
    CartItem.create!(design_id: design_properties)
  end
end
