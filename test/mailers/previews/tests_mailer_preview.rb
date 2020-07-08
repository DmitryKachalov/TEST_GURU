# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview

  def contact_email
    contact = Contact.first

    ContactsMailer.contact_email(contact)
  end

end
