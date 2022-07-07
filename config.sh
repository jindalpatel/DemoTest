#!/bin/bash
# echo "localhost:8080 maki2011.miso.saucelabs.com" >> /etc/hosts
cd Desktop
curl -0 https://github.com/ZindalP/DemoTest/blob/main/PasswordEncryption/test_case.py
curl -0 https://github.com/ZindalP/DemoTest/blob/main/PasswordEncryption/Constant.py
python3 test_case.py
