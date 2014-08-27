class AdminController < ApplicationController
  http_basic_authenticate_with name: '', password: Rails.application.secrets.admin_password
  layout 'admin'
end
