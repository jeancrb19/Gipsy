Dado(/^que estou na url "([^"]*)"$/) do |arg1|
  visit(arg1)
  sleep(2)
end

Dado(/^pesquiso por "([^"]*)" na "([^"]*)"$/) do |arg1, arg2|
  find(arg2).set(arg1)
  find(arg2).native.send_keys(:enter)
end

Entao(/^espero que sejam listados iphone x$/) do
  if has_text?('Iphone X', wait: 50)
    puts 'Sucesso tem iPhone na tela'
  else
    raise 'Não foram apresentados iphones X'
  end
end
