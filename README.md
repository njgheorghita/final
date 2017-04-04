# URLockBox

## Authentication

## MidModule Assessment

The URLockbox is a starter app for the mid-module assessment for backend engineering module4 at TuringSchool of Software and Design.

Be sure to get familiar with what is already done, and what is not. No features are complete, but there is some set up done for several features. Use commit history if that helps.

### Testing your JS with Selenium

The app has the `selenium-webdriver` gem listed in the `Gemfile` and setup in the `rails_helper.rb`

#### Setup

Everything will be installed with Bundle.

You will need to download version 46 of Firefox [here](https://www.softexia.com/windows/web-browsers/firefox-46). If you do have it, make sure it is on version 46. Selenium does not work with all versions of Firefox, so make sure that you are using Firefox 46 or else it will potentially cause you problems. 

If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then install version 46.

#### Use

You can then write capybara feature tests and add `js: true` tag if you'd like your test to use the Selenium WebDriver rather than the default WebDriver.  Your tests will execute and recognize your JavaScript.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

It is highly suggested that you also check out the Capybara docs and and the section on [selenium-webdriver](https://github.com/teamcapybara/capybara#selenium).
