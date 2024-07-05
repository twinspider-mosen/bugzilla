require "test_helper"

class ProjectMailerTest < ActionMailer::TestCase
  test "new_project_mailer" do
    mail = ProjectMailer.new_project_mailer
    assert_equal "New project mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
