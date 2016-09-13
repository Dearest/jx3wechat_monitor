class ActiveCodeController < ApplicationController
  def code
    codes = ActiveCode.select(:code).where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day)).map(&:code).join('|')
    render plain: codes.present? ? codes : ''
  end
end
