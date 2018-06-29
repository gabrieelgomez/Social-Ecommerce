module Api::V1::Products
  class ActionController < ProductsController
    before_action :authenticate_v1_user!
    before_action :current_user_productable
    before_action :validate_password, only: %i[destroy]
    before_action :set_product, only: %i[destroy update]


    def create
      @product = @productable.products.new(product_params)
      @product.tag_list.add(params[:product][:tags])
      files = params[:product][:document_data]
      multiple_images = params[:product][:photos]

      if @product.save
        unless files.nil?
          #iterate through each of the files
          files.each do |file|
              @product.documents.create!(document: file, product: @product)
              #create a document associated with the product that has just been created
          end
        end

        unless multiple_images.nil?
          #iterate through each of the multiple_images
          multiple_images.each do |image|
              @product.photos.create!(photo: image, photoable: @product)
              #create a document associated with the product that has just been created
          end
        end

        render json: @product, status: 200
      else
        render json: @product.errors,
               status: 500
      end
    end

    def update
      subcategory_ids = params[:product][:subcategory_ids]
      @product.subcategory_ids = subcategory_ids unless subcategory_ids.nil?
      @product.tag_list.add(params[:product][:tags])
      files = params[:product][:document_data]
      multiple_images = params[:product][:photos]
      
      unless files.nil?
        #iterate through each of the files
        files.each do |file|
            @product.documents.create!(document: file, product: @product)
            #create a document associated with the product that has just been created
        end
      end

      unless multiple_images.nil?
        #iterate through each of the multiple_images
        multiple_images.each do |image|
            @product.photos.create!(photo: image, photoable: @product)
            #create a document associated with the product that has just been created
        end
      end


      if @product.update(product_params)
        render json: @product, status: 200
      else
        render json: @product.errors,
               status: 500
      end
    end

    def destroy
      if @product.destroy
        render json: @product, status: 200
      else
        render json: @product.errors,
               status: 500
      end
    end
  end
end
