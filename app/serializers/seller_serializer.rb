class SellerSerializer < ProfileSerializer
  attributes :products

  def products
    object.products.map do |product|
      product.as_json(
        include: [
          'subcategories' => {
            only: [:id, :name]
          }
        ], methods: %i[url_get]
      ).merge(
        categories: product.productable.categories
      )
    end
  end
end
