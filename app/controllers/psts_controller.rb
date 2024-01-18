class PstsController < ApplicationController
  before_action :set_pst, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]
  # before_action :authorize_user, except: %i[index show]
  # GET /psts or /psts.json
  def index
    @psts = Pst.all
  end

  # GET /psts/1 or /psts/1.json
  def show
  end

  # GET /psts/new
  def new
    @pst = Pst.new
  end

  # GET /psts/1/edit
  def edit
    authorize @pst

  end

  # POST /psts or /psts.json
  def create
    @pst = Pst.new(pst_params)
    authorize @pst

    respond_to do |format|
      if @pst.save
        format.html { redirect_to pst_url(@pst), notice: "Pst was successfully created." }
        format.json { render :show, status: :created, location: @pst }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psts/1 or /psts/1.json
  def update
  authorize @pst
    respond_to do |format|
      if @pst.update(pst_params)
        format.html { redirect_to pst_url(@pst), notice: "Pst was successfully updated." }
        format.json { render :show, status: :ok, location: @pst }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psts/1 or /psts/1.json
  def destroy
    authorize @pst

    @pst.destroy!

    respond_to do |format|
      format.html { redirect_to psts_url, notice: "Pst was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # def authorize_user
  # @post=@pst || Pst
  # authorize @post
  # end
    # Use callbacks to share common setup or constraints between actions.
    def set_pst
      @pst = Pst.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pst_params
      params.require(:pst).permit(:title, :body, :published)
    end
end
