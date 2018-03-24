class WikiController < ApplicationController
  def index
    @wiki = Wiki.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
