class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    console
  end
end
