module Admin::V1
  class LicensesController < ApiController
    before_action :load_licenses, only: [:show, :update, :destroy]

    def index
      @license = License.all
    end

    def show; end

    def create
      @license = License.new
      @license.attributes = license_params
      save_license!
    end

    def update
      @license.attributes = license_params
      save_license!
    end

    def destroy
      @license.destroy
    end

    private

    def load_licenses
      @license = License.find(params[:id])
    end

    def save_license!
      @license.save!
      render :show
    rescue
      render_error(fields: @license.errors.messages)
    end

    def license_params
      return {} unless params.has_key?(:license)
      params.require(:license).permit(:id, :key, :user_id, :game_id)
    end
  end
end
