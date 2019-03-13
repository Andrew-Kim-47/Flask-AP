from flask import Flask, request, render_template
import subprocess

app = Flask(__name__)

@app.route('/')
def my_form():
    return render_template('wifi.html')

@app.route('/result', methods=['POST'])
def password():
    ssid = request.form['text']
    arg = []
    arg.append(ssid)
    subprocess.Popen(['./ssid.sh', ' '.join(arg)])
    return render_template('password.html')

@app.route('/end', methods=['POST'])
def thank():
    psw = request.form['psw']
    arg2 = []
    arg2.append(psw)
    subprocess.Popen(['./psw.sh', ' '.join(arg2)])
    subprocess.Popen('./gowifi.sh')
    return "Thank you"

if __name__ == '__main__':
   app.run(host= '0.0.0.0', port=3456)
