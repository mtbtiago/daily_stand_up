class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def show
    redirect_to edit_response_path(slug: @response.slug), flash: { error: 'User not respondended yet, must edit before' } \
      if @response.user_responded.nil? && @response.on_time?
  end

  # GET /responses/new
  # GET /responses/1/edit
  def edit
    redirect_to response_path(slug: @response.slug), flash: { error: 'Standup has finished. Cannot modify your responses' } \
      unless @response.on_time?
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to response_path(slug: @response.slug), notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit, slug: @response.slug }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find_by(slug: params[:slug])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def response_params
    params.require(:response).permit(:response_a, :response_b, :response_c)
  end
end
