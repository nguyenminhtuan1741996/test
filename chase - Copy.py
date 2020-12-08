from selenium import webdriver
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
    driver = webdriver.Chrome()
    driver.maximize_window()
    wait = WebDriverWait(driver, 20, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    a = ActionChains(driver)
         ####################################################################################################################################
    driver.get("https://account.chase.com/consumer/banking/seo")
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "div.field--name-field-reusable-paragraphs:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)"))).click()
    wait.until(EC.visibility_of_element_located((By.XPATH, "//div[text()='No']"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-firstName-text-validate-input-field"))).send_keys(request['first_name'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-middleName-text-validate-input-field"))).send_keys(request['middle_name'].replace(' ',''))
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-nameBlock-lastName-text-validate-input-field"))).send_keys(request['last_name'].replace(' ',''))
    wait.until(EC.visibility_of_element_located((By.XPATH, "//div[text()='Yes']"))).click()
    #wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#select-legalResidencyStatusOption-select-validate"))).send_keys('u')
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
    time.sleep(3)
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#label-navigationAdvisory"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#NEXT-nav-ctr-btn"))).click()
    wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#blx-undefined-address-verification-overlay-conf-btn"))).click()
    wait_check = WebDriverWait(driver, 15, poll_frequency=1, ignored_exceptions=[ElementNotVisibleException, ElementNotSelectableException])
    try:
        wait_check.until(EC.visibility_of_element_located((By.XPATH, "//span[text()='Employed']"))).click()
    except TimeoutException:
        driver.quit()
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=2')
        reg_chase()
    else:
        chase = requests.get('http://datacentervn.net/admin/update_chase?id='+account['id']+'&param=status&value=1')
        ssn = requests.get('http://datacentervn.net/admin/update_ssn?id='+request['id']+'&param=status&value=1')
        wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#employerDetails-0-employerNameId-text-validate-input-field"))).send_keys('ads')
        wait.until(EC.visibility_of_element_located((By.XPATH, "//*[@id='select-employerDetails-0-employmentCategoryId-select-validate']"))).click()
        wait.until(EC.visibility_of_element_located((By.XPATH, "//option[@value='TECHNOLOGY']"))).click()
        #wait.until(EC.visibility_of_element_located((By.XPATH, "//option[@value='THREE']"))).click()
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
        wait_setup.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#SETUP-nav-ctr-btn click"))).click()
        wait.until(EC.visibility_of_element_located((By.XPATH, "//span[text()='Remember me']")))
        driver.quit()

reg_chase()
