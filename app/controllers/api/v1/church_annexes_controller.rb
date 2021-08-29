module Api
  class V1::ChurchAnnexesController < V1Controller
    before_action :set_church_annex, only: [:show, :update, :destroy]

    # GET /church_annexes
    def index
      @church_annexes = ChurchAnnex.all

      render json: @church_annexes
    end

    # GET /church_annexes/1
    def show
      render json: @church_annex
    end

    # POST /church_annexes
    def create
      @church_annex = ChurchAnnex.new(church_annex_params)

      if @church_annex.save
        render json: @church_annex, status: :created, location: @church_annex
      else
        render json: @church_annex.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /church_annexes/1
    def update
      if @church_annex.update(church_annex_params)
        render json: @church_annex
      else
        render json: @church_annex.errors, status: :unprocessable_entity
      end
    end

    # DELETE /church_annexes/1
    def destroy
      @church_annex.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_church_annex
      @church_annex = ChurchAnnex.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def church_annex_params
      params.require(:church_annex).permit(:name, :address, :capacity, :enabled, :church_id)
    end
  end
end
