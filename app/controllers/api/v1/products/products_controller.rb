module Api::V1
  class Products::ProductsController < ApiController
  	include ::Api::V1::Concerns::ProductSearch
    include ::Api::V1::Concerns::ModelModulation
  end
end
