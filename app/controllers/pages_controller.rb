class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team, :cgu, :rgpd, :update_calendly ]
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

  def calendly
    p "CALENDLY I'm In GET"
    return "ok post", 200
  end

  def update_calendly
    p "CALENDLY I'm In POST"
    return "ok post", 200
  end


  def team

  end

  def cgu

  end

  def rgpd

  end

end
