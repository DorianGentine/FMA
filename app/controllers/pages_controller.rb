class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team, :cgu, :rgpd, :control]
  # skip_after_action :intercom_rails_auto_include

  def home
    @choices = FormularyChoice.new.set_collections_formulary
    @visitor = Visitor.find_by(user_ip: request.ip)
    if @visitor.nil? || @visitor.formulary.nil?
      @formulary = Formulary.new
    else
      @formulary = @visitor.formulary
      FormularyToHash.new(@formulary).form_json
    end
  end

  def control

  end

  def team

  end

  def cgu

  end

  def rgpd

  end
  def prise_de_rdv
    p " params send => #{params}"
    p "/////event_start_time #{params["event_start_time"]}"
    p "/////test time #{ DateTime.parse(params['event_start_time'])}"

    # appointment = Time.parse(params["event_start_time"])
    app = l(params["event_start_time"], :format => '%A %d %B %Y à %Hh%M')
    p "/////appointment #{app}"
    if current_user
      @user = current_user
      set_appointment(@user)
    elsif User.find_by(params["answer_1"]).present?
      @user = User.find_by(params["answer_1"])
      set_appointment(@user)
    else
      @user = false
    end
  end


  private

  def set_appointment(user)
    @project = user.project
    if app.present?
      @project.appointment = app
      @project.save
      UserMailer.with(user: user, project: @project).appointment.deliver_now
      UserMailer.with(user: User.find(1), project: @project).appointment.deliver_now
    end
  end
end

