class TagsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
