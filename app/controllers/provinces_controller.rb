class ProvincesController < ApplicationController
  def province_params
    params.require(:province).permit(:id, :name, :tax_rate)
  end
end
