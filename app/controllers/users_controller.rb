class UsersController < ApplicationController

  def show
    @formulary_setted = FormularyToHash.new(Formulary.first).form_json_for_espace
    @current_user = current_user
    @user = User.find(params[:id])

    authorize @current_user
  end

end
