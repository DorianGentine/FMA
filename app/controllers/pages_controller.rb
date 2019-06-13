class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team, :cgu, :rgpd]
  skip_after_action :intercom_rails_auto_include

  def home
    @choices = FormularyChoice.new.set_collections_formulary
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil? || @visitor.formulary.nil?
      @formulary = Formulary.new
    else
      @formulary = @visitor.formulary
    end
  end

  def team

  end

  def cgu

  end

  def rgpd

  end
  def prise_de_rdv
    if current_user
      @user = current_user
    else
      @user = false
    end
  end
end
