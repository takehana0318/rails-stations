class InquiryMailer < ApplicationMailer
    def send_mail(inquiry, dst_email)
        @inquiry = inquiry
        mail(
          from: 'system@example.com',
          to:   dst_email,
          subject: 'お問い合わせ通知'
        )
    end
end
