class EntryTypesController < ApplicationController
  before_action :set_entry_type, only: %i[ show edit update destroy ]

  # GET /entry_types or /entry_types.json
  def index
    @entry_types = EntryType.all
  end

  # GET /entry_types/1 or /entry_types/1.json
  def show
  end

  # GET /entry_types/new
  def new
    @entry_type = EntryType.new
  end

  # GET /entry_types/1/edit
  def edit
  end

  # POST /entry_types or /entry_types.json
  def create
    @entry_type = EntryType.new(entry_type_params)

    respond_to do |format|
      if @entry_type.save
        format.html { redirect_to entry_type_url(@entry_type), notice: "Entry type was successfully created." }
        format.json { render :show, status: :created, location: @entry_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entry_types/1 or /entry_types/1.json
  def update
    respond_to do |format|
      if @entry_type.update(entry_type_params)
        format.html { redirect_to entry_type_url(@entry_type), notice: "Entry type was successfully updated." }
        format.json { render :show, status: :ok, location: @entry_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entry_types/1 or /entry_types/1.json
  def destroy
    @entry_type.destroy!

    respond_to do |format|
      format.html { redirect_to entry_types_url, notice: "Entry type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_type
      @entry_type = EntryType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_type_params
      params.require(:entry_type).permit(:challenge_id, :name, :units, :weight)
    end
end
