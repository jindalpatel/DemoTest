import unittest
from appium import webdriver
from time import sleep
from datetime import datetime
import Constant
from selenium.webdriver.common.by import By
import requests



setUp()

    # set up appium
def setUp(self):
    currentDate = datetime.now().strftime('%Y-%m-%d')
    currentTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    caps = {}
        
    caps['platformName'] = 'iOS
    caps['appium:app'] = 'storage:filename=SmokeTest.zip' # The filename of the mobile app
    caps['appium:deviceName'] = 'iPhone 11 Simulator'
    caps['appium:platformVersion'] = '15.0'
    caps['sauce:options'] = {}
    caps['sauce:options']['appiumVersion'] = '1.22.3'
    caps['sauce:options']['build'] = 'Platform Configurator Build ' + currentDate
    caps['sauce:options']['name'] = 'Platform Configurator Job ' + currentTime
    caps['prerun'] = 'https://github.com/ZindalP/DemoTest/blob/main/config.sh'
    url = 'https://oauth-jindal.patel-3782a:01f7c8a5-53fa-4288-b91b-7767cd2b2218@ondemand.eu-central-1.saucelabs.com:443/wd/hub'
    self.driver=webdriver.Remote(url,caps)
