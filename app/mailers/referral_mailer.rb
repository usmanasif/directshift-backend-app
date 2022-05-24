class ReferralMailer < ApplicationMailer
  def referral_mail(recipient)
    mail(to: recipient, subject: 'Direct Shift Membership')
  end
end
