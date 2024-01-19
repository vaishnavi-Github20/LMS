class UniLibrariesController < ApplicationController
  before_action :set_uni_library, only: %i[ show edit update destroy ]

  # GET /uni_libraries or /uni_libraries.json
  def index
    @uni_libraries = UniLibrary.all
  end

  # GET /uni_libraries/1 or /uni_libraries/1.json
  def show
  end

  # GET /uni_libraries/new
  def new
    @uni_library = UniLibrary.new
  end

  # GET /uni_libraries/1/edit
  def edit
  end

  # POST /uni_libraries or /uni_libraries.json
  def create
    @uni_library = UniLibrary.new(uni_library_params)

    respond_to do |format|
      if @uni_library.save
        format.html { redirect_to uni_library_url(@uni_library), notice: "Uni library was successfully created." }
        format.json { render :show, status: :created, location: @uni_library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uni_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uni_libraries/1 or /uni_libraries/1.json
  def update
    respond_to do |format|
      if @uni_library.update(uni_library_params)
        format.html { redirect_to uni_library_url(@uni_library), notice: "Uni library was successfully updated." }
        format.json { render :show, status: :ok, location: @uni_library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uni_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uni_libraries/1 or /uni_libraries/1.json
  def destroy
    @uni_library.destroy

    respond_to do |format|
      format.html { redirect_to uni_libraries_url, notice: "Uni library was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uni_library
      @uni_library = UniLibrary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uni_library_params
      params.require(:uni_library).permit(:name, :university, :location, :no_of_books, :overdue_fine)
    end
end
