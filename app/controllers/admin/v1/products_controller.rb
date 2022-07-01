module Admin::V1
  class ProductsController < ApiController

    def index
      @products = load_products
    end

    def create
    end

    def show;end

    def update
    end

    def destroy
    end

    private

    def load_products
      permitted = params.permit({ search: :name }, { order: {} }, :page, :length)
      Admin::ModelLoadingService.new(Product.all, permitted).call
    end

    def product_params
      return {} unless params.has_key?(:product)

      permitted_params = params.permit(:product).permit(
        :id,
        :name,
        :description,
        :image,
        :price,
        :productable,
        :status,
        category_ids: []
      )
      permitted_params.merge(productable_params)
    end

    def productable_params
      productable_type = params[:product][:productable] || @product&.productable_type&.underscore
      return unless productable_type.present?

      send("#{productable_type}_params")
    end

    def games_params
      params.require(:product).permit(
        :mode,
        :release_date,
        :developer,
        :system_requirement_id
      )
    end

    def run_service(_product = nil)
      @saving_service = Admin::ProductSavingService.new(product_params.to_h, @product)
      @saving_service.call
      @product = @saving_service.product
      render :show
    end
  end
end
