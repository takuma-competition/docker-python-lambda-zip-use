#はじめにimportの検索pathを追加するcodeを記載する。
import os
import sys
sys.path.append(os.path.join(os.path.dirname(__file__), './packages'))

import requests
def lambda_handler(event, context):   
    response = requests.get("https://www.example.com/")
    print(response.text)
    return response.text