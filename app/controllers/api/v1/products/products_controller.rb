module Api::V1
  class Products::ProductsController < ApiController
  	include ::Api::V1::Concerns::ProductSearch
  end
end
