class Admin::HomesController < ApplicationController

before_action :authenticate_admin!

  def top
  	@contacts = Contact.where(react_status: "backlog" )
  end
end