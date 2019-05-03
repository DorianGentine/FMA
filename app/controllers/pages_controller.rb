class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team, :cgu ]

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

end
