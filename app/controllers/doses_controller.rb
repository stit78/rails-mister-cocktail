class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # We redefine parameters if we need to render :new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = []
    Ingredient.all.each do |ingredient|
      @ingredients << ingredient.name
    end

    # We create our new instance
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    # We check if instance is valid and act according to answer
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
