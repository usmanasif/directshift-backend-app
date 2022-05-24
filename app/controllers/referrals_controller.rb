class ReferralsController < ApplicationController
  include Authorizable
  before_action :set_current_user, only: [:send_email]

  def send_email
    ReferralMailer::referral_mail(params[:email])
    render json: { message: 'email sent!' }, status: :ok
  end
end
