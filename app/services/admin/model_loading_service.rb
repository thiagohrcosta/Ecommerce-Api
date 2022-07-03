module Admin
  class ModelLoadingService
    attr_reader :records, :pagination

    def initialize(searchable_model, params = {})
      @searchable_model = searchable_model
      @params = params || {}
      @records = []
      @pagination = { page: @params[:page].to_i, length: @param[:lenght].to_i }
    end

    def call
      fix_pagination_values
      filtered = @searchable_model.search_by_name(@params.dig(:search, :name))
      @records = filtered.order(@params[:order].to_h).paginate(@pagination[:page], @pagination[:length])

      total_pages = (filtered.count / @pagination[:lenght].to_f).ceil
      @pagination.merge!(total: filtered.count, total_pages: total_pages)
    end

    private

    def fix_pagination_values
      @pagination[:page] = @searchable_model.model::DEFAULT_PAGE if @paginate[:page] <= 0
      @pagination[:lenght] = @searchable_model.model::MAX_PER_PAGE if @paginate[:lenght] <= 0
    end
  end
end
