describe 'Acceptance Criteria' do
  it 'statement shows all activity for an account, in required format' do
    account = Account.new
    account.transaction('deposit', 1000, '10-01-2012')
    account.transaction('deposit', 2000, '13-01-2012')
    account.transaction('withdraw', 500, '14-01-2012')
    statement = Statement.new
    statement_printout = statement.print_statement(account)
    expect(statement_printout).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
  end
end
