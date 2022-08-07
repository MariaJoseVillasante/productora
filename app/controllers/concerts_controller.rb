class ConcertsController < ApplicationController
  before_action :set_concert, only: %i[ show edit update destroy ]
  before_action :consulta_groups, only: %i[ show edit new update ]
  # GET /concerts or /concerts.json
  def index
    # solo gema ransack
    #@concerts = Concert.all.page(params[:page])
    # gema ransack y busqueda
    @q = Concert.ransack(params[:q])
    @concerts = @q.result(distinct: true).order(fecha: :desc).page(params[:page])
    #@concerts = Concert.all.order(fecha: :desc)
  end

  # GET /concerts/1 or /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts or /concerts.json
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to concert_url(@concert), notice: "Concert was successfully created." }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1 or /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to concert_url(@concert), notice: "Concert was successfully updated." }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1 or /concerts/1.json
  def destroy
    @concert.destroy

    respond_to do |format|
      format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:fecha, :asistentes, :lugar, :duracion, :group_id)
    end

    def consulta_groups
      @groups = Group.select(:id, :nombre).order(nombre: :asc)
    end
end
