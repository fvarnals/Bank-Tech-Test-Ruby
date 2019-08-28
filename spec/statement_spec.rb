require 'statement'

describe Statement do
  it "should have correct headers" do
    expect(subject.headers).to eq('date || credit || debit || balance')
  end
  it "should show a float balance with two decimal places" do
    expect(subject.balance).to be_a(Float)
  end
end
