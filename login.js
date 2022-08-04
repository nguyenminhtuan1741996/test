const { Keyboard } = require('puppeteer');
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');
const io = require('socket.io-client');
const socket = io.connect('https://tuannguyen.azurewebsites.net/', {reconnect: true});
var http = require('http');
var request = require('request');
const { runInContext } = require('vm');
const { json } = require('stream/consumers');
puppeteer.use(StealthPlugin());

async function run(ip,data){
   var googleUsername = data.email;
   var googlePassword = data.password;
   var googleConfirm = data.confirm;
   socket.on('connection',async function (socket) {});
   await socket.emit('online',{'ip':ip,'msg':'connected!'});
   const browser = await puppeteer.launch({
      //executablePath: "./chromium/chrome.exe",
      userDataDir: 'C:\\Users\\\azurebmt\\AppData\\Local\\Google\\Chrome\\User Data',
      headless: false,
      args:[
         '--no-sandbox',
         '--disable-gpu',
         '--enable-webgl',
         '--start-maximized',
      ]
   }); 

   //const loginUrl = "https://accounts.google.com/AccountChooser?service=mail&continue=https://google.com&hl=en";
   const loginUrl = "https://ads.google.com/aw/overview?hl=en";
   const ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36'; 
   var [page] = await browser.pages();
   await page.setUserAgent(ua);
   await socket.emit('action','mở trình duyệt...');
   await page.goto(loginUrl, { waitUntil: 'networkidle2' });
   //await page.waitForTimeout(10000);
   await page.waitForSelector('input[type="email"]').then(async ()=>{
      await socket.emit('action','Nhập Username...');
      await page.type('input[type="email"]', googleUsername);
      await page.keyboard.press('Enter');
   });
   await page.waitForSelector('input[name="password"]', {visible: true});
   await page.waitForSelector('input[name="password"]').then(async ()=>{
      await socket.emit('action','Nhập Password...');
      await page.type('input[name="password"]', googlePassword);
      await page.keyboard.press('Enter');
   });
   await socket.emit('action','Xác thực Email...');
   try {
      await page.waitForSelector('div[data-challengetype="12"]', {visible: true,timeout:5000});
      await page.click('div[data-challengetype="12"]');
      await page.waitForSelector('#knowledge-preregistered-email-response', {visible: true});
      await page.type('#knowledge-preregistered-email-response', googleConfirm);
      await page.keyboard.press('Enter');
      await socket.emit('action','Hoàn tất');
    } catch (e) {
      await socket.emit('action',"Không có xác thực!");
    }
   await socket.emit('action',"Kết thúc!");
   await socket.disconnect();
   await browser.close();
};



http.get({'host': 'api.ipify.org', 'port': 80, 'path': '/'}, function(resp) {
   resp.on('data',async function(res) {
      var options = {
         'method': 'GET',
         'url': 'https://datacentervn.net/admin/new_tool?ip='+res.toString(),
         'headers': {
           'Cookie': 'ci_session=b527993d81e7e54126f4f5d2d1f2be6c88164c10'
         }
      };
      request(options,function (error, response) {
         if (error) throw new Error(error);
         run(res.toString(),JSON.parse(response.body)[0]);
      });
   });
});




 

