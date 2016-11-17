class DosesController < ApplicationController
  def new
    @coktail = Dose.new
  end
  def create
        @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else 
      render :new 
    end
  end

  def destroy
    @dose.delete
    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
