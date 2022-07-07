from appium import webdriver
from time import sleep
from datetime import datetime
from selenium.webdriver.common.by import By

def setUp():
    currentDate = datetime.now().strftime('%Y-%m-%d')
    currentTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    caps = {}
        
    caps['platformName'] = 'iOS'
    caps['appium:app'] = 'storage:filename=SmokeTest.zip' # The filename of the mobile app
    caps['appium:deviceName'] = 'iPhone 11 Simulator'
    caps['appium:platformVersion'] = '15.0'
    caps['sauce:options'] = {}
    caps['sauce:options']['appiumVersion'] = '1.22.3'
    caps['sauce:options']['build'] = 'Platform Configurator Build ' + currentDate
    caps['sauce:options']['name'] = 'Platform Configurator Job ' + currentTime
#     caps['prerun'] = {
#         'executable' : 'https://github.com/ZindalP/DemoTest/blob/main/config.sh',
#         'background' : 'false'
#     }
    url = 'https://sso-splunk.saucelabs.com-mahimag:274c9a94-86d1-4b12-9594-57307cfb2c57@ondemand.us-west-1.saucelabs.com:443/wd/hub'
    driver=webdriver.Remote(url,caps)

        
if __name__ == "__main__":
    setUp()
