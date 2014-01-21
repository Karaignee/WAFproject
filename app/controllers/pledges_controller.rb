class PledgesController < ApplicationController


  def index
    @pledges = Pledge.all


  end


  def show
    @pledge = Pledge.find(params[:id])


  end


  def new
    @pledge = Pledge.new


  end

  # GET /pledges/1/edit
  def edit
    @pledge = Pledge.find(params[:id])
  end


  def create
    @pledge = Pledge.new(params[:pledge])
    @pledge.user_id = current_user.id
    if @pledge.save
      redirect_to project_path(@pledge.task.project_id), notice: 'Thank you for volunteering, your pledge has been recorded'
    end

  end


  def update
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      if @pledge.update_attributes(params[:pledge])
        format.html { redirect_to @pledge, notice: 'Pledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.json
  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy

    respond_to do |format|
      format.html { redirect_to pledges_url }
      format.json { head :no_content }
    end
  end
end
