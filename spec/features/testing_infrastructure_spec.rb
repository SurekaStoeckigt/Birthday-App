require './app.rb'


feature 'calculates days until next birthday if not today' do

  scenario 'welcomes user to the page' do
    visit('/')
    expect(page).to have_content "Hello there!\nWhat's your name?\nWhen's your birthday?\nday: month:"
  end

  scenario 'calculates days till next birthday' do
    visit('/')
    fill_in :name, with: 'test_user'
    fill_in :day, with: '10'
    page.select('January', :from => 'month')
    click_button 'Go'
    expect(page).to have_content"Your birthday will be in 291 days!"
  end

  scenario 'wishes user happy birthday if Birthday is today' do
    visit('/')
    fill_in :name, with: 'test_user'
    fill_in :day, with: '25'
    page.select('March', :from => 'month')
    click_button 'Go'
    expect(page).to have_content"Happy Birthday, test_user!"
  end

end
