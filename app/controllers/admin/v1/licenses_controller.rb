module Admin::V1
  class LicensesController < ApiController
    before_action :load_licenses, only: [:show, :update, :destroy]

    def index
    end

    def show;end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def load_licenses
      @license = License.find(params[:id])
    end

    def license_params
      return {} unless params.has_key?(:license)
      params.require(:license).permit(:id, :key, :user_id, :game_id)
    end
  end
end
