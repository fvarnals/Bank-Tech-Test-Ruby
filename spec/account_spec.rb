require 'account'

describe Account do
  it "should have a balance" do
    expect(subject.balance).not_to be(NIL)
  end
end
