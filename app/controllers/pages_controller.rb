class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team, :cgu, :rgpd]
  # skip_after_action :intercom_rails_auto_include

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
    p " params send => #{params}"
    p "/////answer_1 #{params["answer_1"]}"
    appointment = Time.parse(params["event_start_time"])
    p "/////appointment #{appointment}"
    if current_user
      @user = current_user
      @project = @user.project
      if appointment.present?
        @project.appointment = appointment
        p "///// project appointment #{ @project.appointment}"
        @project.save
      end
    elsif User.find_by(params["answer_1"]).present?
      @user = User.find_by(params["answer_1"])
      @project = @user.project
      if appointment.present?
        @project.appointment = appointment
        @project.save
      end
    else
      @user = false
    end
  end
end

