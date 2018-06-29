module Api::V1::Products
  class Uploaders::UploadersController < ProductsController
    before_action :authenticate_v1_user!
    before_action :set_product

    def destroy
      if @upload.destroy
        render json: @upload, status: 200
      else
        render json: @upload.errors,
               status: 500
      end
    end

    private
    def set_product

      if params[:type_upload].eql?('photo')
        @upload = custom_find { 
          Product.find(params[:product_id]).photos.find(params[:file_id])
        }
      elsif params[:type_upload].eql?('document')
        @upload = custom_find { 
          Product.find(params[:product_id]).documents.find(params[:file_id])
        }
      end


    end

  end
end
