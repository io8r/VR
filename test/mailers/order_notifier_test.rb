require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "test received", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal "Gav gav gav", mail.from
  
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "test shipped", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal "Gav gav gav", mail.from
    
  end

end
