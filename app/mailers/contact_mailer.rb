class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "kaoru.onuki@gmail.com, kit@nextyle.co.jp", subject: "【商標登録】調査依頼メール"
  end
end
