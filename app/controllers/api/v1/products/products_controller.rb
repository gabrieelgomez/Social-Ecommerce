module Api::V1
  class Products::ProductsController < ApiController
  	include Concerns::ProductSearch
  end
end
