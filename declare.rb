require 'byebug'
require 'dotenv'
Dotenv.load!

require 'nokogiri'
require 'webdrivers/chromedriver'
require 'watir'

def call(url)
  get_sign_in_page(url)
end

def get_sign_in_page(url)
  browser = Watir::Browser.new :chrome, headless: true
  browser.goto(url)

  click_first_sign_in(browser)
end

def click_first_sign_in(page)
  page.link(:class => 'text-bold color-white edu-connect btn color-blue border-blue btn-connect-briut').click

  fill_in_sign_in_form(page)
end

def fill_in_sign_in_form(page)
  page.text_field(id: /HIN_USERID/).set(ENV['USERNAME'])
  page.text_field(id: /Ecom_Password/).set(ENV['PASSWORD'])
  page.button(name: /loginButton2/).click

  fill_out_declaration(page)
end

def fill_out_declaration(page)

end

call(ENV['URL'])