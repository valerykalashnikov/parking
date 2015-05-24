class ControlPanelController < ApplicationController
  def display
    @vehicle = Vehicle.new
  end
end