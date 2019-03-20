class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "kaoru.onuki@gmail.com, ko3_4j@hotmail.com", subject: "【商標登録】調査依頼メール"
  end
end
