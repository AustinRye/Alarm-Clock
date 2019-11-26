from flask import render_template, request, jsonify

from app import app, alarmClock


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/startTransmit', methods=['POST'])
def startTransmit():
    alarmClock.startTransmit()
    return jsonify({'startTransmit': 'True'}), 201


@app.route('/stopTransmit', methods=['POST'])
def stopTransmit():
    alarmClock.stopTransmit()
    return jsonify({'stopTransmit': 'True'}), 201


@app.route('/reset', methods=['POST'])
def reset():
    reset = request.args.get('reset')
    alarmClock.reset = int(reset)
    return jsonify({'reset': reset}), 201


@app.route('/changeTime', methods=['POST'])
def changeTime():
    changeTime = request.args.get('changeTime')
    alarmClock.changeTime = int(changeTime)
    return jsonify({'changeTime': changeTime}), 201


@app.route('/changeAlarm', methods=['POST'])
def changeAlarm():
    changeAlarm = request.args.get('changeAlarm')
    alarmClock.changeAlarm = int(changeAlarm)
    return jsonify({'changeAlarm': changeAlarm}), 201


@app.route('/minutesInc', methods=['POST'])
def minutesInc():
    minutesInc = request.args.get('minutesInc')
    alarmClock.minutesInc = int(minutesInc)
    return jsonify({'minutesInc': minutesInc}), 201


@app.route('/minutesDec', methods=['POST'])
def minutesDec():
    minutesDec = request.args.get('minutesDec')
    alarmClock.minutesDec = int(minutesDec)
    return jsonify({'minutesDec': minutesDec}), 201


@app.route('/hoursInc', methods=['POST'])
def hoursInc():
    hoursInc = request.args.get('hoursInc')
    alarmClock.hoursInc = int(hoursInc)
    return jsonify({'hoursInc': hoursInc}), 201


@app.route('/hoursDec', methods=['POST'])
def hoursDec():
    hoursDec = request.args.get('hoursDec')
    alarmClock.hoursDec = int(hoursDec)
    return jsonify({'hoursDec': hoursDec}), 201


@app.route('/alarmEnable', methods=['POST'])
def alarmEnable():
    alarmEnable = request.args.get('alarmEnable')
    alarmClock.alarmEnable = int(alarmEnable)
    return jsonify({'alarmEnable': alarmEnable}), 201
