class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end


  def create
    @email = Email.new(object:Faker::Lorem.sentence, body:Faker::Lorem.paragraph)
    if @email.save
      respond_to do |format|
       format.html { redirect_to root_path }
       format.js { }
      end
      flash[:notice] = "Email created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def destroy
    @email = Email.find(params[:id])
    respond_to do |format|
     format.html { redirect_to root_path }
     format.js { }
    end
  end


end
