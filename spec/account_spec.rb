require 'account'

describe Account do
  it "is instance of the Account class" do
    expect(subject).to be_an_instance_of(Account)
  end
  it "should have a balance" do
    expect(subject.balance).not_to be(NIL)
  end
  it "should show a float balance even when given a non-float argument" do
    account = Account.new(1)
    expect(account.balance).to be_a(Float)
  end
end
