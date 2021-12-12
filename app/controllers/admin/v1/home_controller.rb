module Admin::V1
  class HomeController < ApiController
    def index
      render json: {message: "Max Vestappen no capricho!!!"}
    end
  end
end