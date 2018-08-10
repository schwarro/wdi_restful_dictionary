class EntriesController < ApplicationController
  def index
# here we'll define some @instance_variables to store data from the database for the views to use
    # render :index
    @entries = Entry.all
  end

  def show
    # render :show
    @entry = Entry.find(params[:id])
  end

  def new
    # render :new
    @entry = Entry.new
  end

  def edit
    # render :edit
    @entry = Entry.find(params[:id])
  end

  def create
    # redirect_to entries_url
    @entry = Entry.new

    @entry.word = params[:entry][:word]
    @entry.language = params[:entry][:language]
    @entry.definition = params[:entry][:definition]

    if @entry.save
      redirect_to entries_url
    else
      render :new
    end
  end

  def update
    # redirect_to entry_url(params[:id])
    @entry = Entry.find(params[:id])

    @entry.word = params[:entry][:word]
    @entry.language = params[:entry][:language]
    @entry.definition = params[:entry][:definition]

    if @entry.save
      redirect_to entries_url
    else
      render :edit
    end
  end

  def destroy
    redirect_to entries_url
    @entry = Entry.find(params[:id])
    @entry.destroy
  end
end
