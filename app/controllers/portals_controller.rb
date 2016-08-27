require 'git'
class PortalsController < ApplicationController
  before_action :authenticate_user!
  def home
    #working_dir = '/home/remotezen/Programming/Projects/rails/gitface'
    @g = Git.open(Rails.root)
  end
end
