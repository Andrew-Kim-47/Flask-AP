from flask import Flask, request, render_template
import subprocess

app = Flask(__name__)

@app.route('/')
def my_form():
    return render_template('wifi.html')

@app.route('/result', methods=['POST'])
def password():
    ssid = request.form['text']
    psw = request.form['psw']
    arg = []
    arg.append(ssid)
    arg3=[]
    arg3.append(psw)
    subprocess.Popen(['/home/pi/Flask-AP/ssid.sh', ' '.join(arg), ' '.join(arg3)])
    subprocess.Popen('/home/pi/Flask-AP/gowifi.sh')
#subprocess.Popen(['/home/pi/Flaks-AP/ssid.sh', "ssid"])
    #return render_template('password.html')
    return "Appreciated"
@app.route('/end', methods=['POST'])
def thank():
    psw = request.form['psw']
    arg2 = []
    arg2.append(psw)
    subprocess.Popen(['/home/pi/Flask-AP/psw.sh', ' '.join(arg2)])
    subprocess.Popen('/home/pi/Flask-AP/gowifi.sh')
    return "Thank you"

if __name__ == '__main__':
   app.run(host= '0.0.0.0', port=3456)
