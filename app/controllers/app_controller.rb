class AppController < ApplicationController

  def home
  end

  def results
    begin
      @results = []
      rover = Rover.new(params[:initial_position], params[:commands])
      plan = Plan.new(params[:coord_upper])
      if rover.msg_error.blank? and plan.msg_error.blank?
        @results = rover.move(plan)
      else
        flash[:error] = "#{rover.msg_error} #{plan.msg_error}"
        redirect_to :root
        return
      end
    rescue => e
      flash[:error] = "Erro! Preencha os dados corretamente!"
      redirect_to :root
    end
  end

end
