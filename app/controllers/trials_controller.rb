class TrialsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :target, [:new, :create]

end
