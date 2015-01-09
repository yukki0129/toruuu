class DashboardController < ApplicationController
 # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_user!, only: :index

  def index
  end
end
