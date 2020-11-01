# frozen_string_literal: true

class DummyController < ActionController::Base
  before_action :authenticate

  def index
    head :ok
  end
end
