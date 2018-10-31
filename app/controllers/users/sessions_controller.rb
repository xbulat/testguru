# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.signed_in', name: current_user.first_name.capitalize)
  end
end
