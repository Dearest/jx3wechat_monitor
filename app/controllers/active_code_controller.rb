class ActiveCodeController < ApplicationController
  def code
    codes = ActiveCode.select(:code).where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day))
    render text: code.map(&:code).join('|')
  end
end
