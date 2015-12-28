class PromoController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def validate
    @code = PromoCode.find_by_code(params[:code])
    if @code
      flash[:success] = "Valid Code"
      redirect_to signup_url
    else
      flash[:danger] = "Invalid. Try another code"
      redirect_to code_url
    end
  end

end