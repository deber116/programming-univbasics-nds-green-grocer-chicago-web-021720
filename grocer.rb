require 'pp'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  collection_index = 0
  result = nil
  while collection_index < collection.count do 
    if collection[collection_index][:item] == name
      result = collection[collection_index]
    end
    collection_index += 1
  end
  result
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  result = []
  cart_index = 0
  while cart_index < cart.count do 
    addition_to_result = cart[cart_index]
    inner_cart_index = 0 
    item_count = 0 
    while inner_cart_index < cart.count do 
      if cart[cart_index] == cart[inner_cart_index]
        item_count += 1
      end
      inner_cart_index += 1
    end
    addition_to_result[:count] = item_count
    result << addition_to_result
    cart_index += 1
  end
  result.uniq
end


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_index = 0 
  final_cart = []
  while cart_index < cart.count do 
    coupon_index = 0 
    while coupon_index < coupons.count do 
      if cart[cart_index][:item] == coupons[coupon_index][:item]
        cart_item = cart[cart_index][:item]
        cart_clearance = cart[cart_index][:clearance]
        cart_count = cart[cart_index][:count]
        coupon_price = coupons[coupon_index][:cost]
        coupon_num = coupons[coupon_index][:num]
        full_price_items = cart_count % coupon_num
        count_items_coupon_price = cart_count - full_price_items
        cart[cart_index][:count] = full_price_items
        coupon_price_per_item = coupon_price / coupon_num
        cart << {
          item: cart_item + " W/COUPON",
          price: coupon_price_per_item,
          clearance: cart_clearance,
          count: count_items_coupon_price
        }
      end
      coupon_index += 1
    end
    cart_index += 1
  end
  cart
end
#itterate through each item in the cart and compare it to the coupons array to see if there are any matches 
#if there are any matches, full_price_items = :count % :num 
#loop result = :count - :num until result == full_price_items and count the number of times the loop is run and then multiply it by :num to get the total count of coupon items
#update the count of full price items
#add updated full price items to final result 
#add coupon items to final result

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
