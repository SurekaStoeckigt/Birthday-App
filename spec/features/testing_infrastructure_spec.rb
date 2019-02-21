feature 'testing infrastructure of homepage' do
  scenario 'can run app and page content' do
    visit('/')
    expect(page).to have_content "Hello there!\nWhat's your name?\nWhen's your birthday?\nday: month:"
  end
end
