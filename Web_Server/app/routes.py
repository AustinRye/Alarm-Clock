from flask import render_template, request, jsonify

from app import app, alarmClock


@app.route('/')
def index():
    return render_template('alarm-clock.html')


@app.route('/startTransmit', methods=['POST'])
def startTransmit():
    alarmClock.startTransmit()
    return jsonify({'startTransmit': 'True'}), 201


@app.route('/stopTransmit', methods=['POST'])
def stopTransmit():
    alarmClock.stopTransmit()
    return jsonify({'stopTransmit': 'True'}), 201


@app.route('/time', methods=['GET'])
def time():
    time = alarmClock.time
    return jsonify({'time': time}), 201


@app.route('/alarmTime', methods=['GET'])
def alarmTime():
    alarmTime = alarmClock.alarmTime
    return jsonify({'alarmTime': alarmTime}), 201


@app.route('/alarmOn', methods=['GET'])
def alarmOn():
    alarmOn = alarmClock.alarmOn
    return jsonify({'alarmOn': alarmOn}), 201


@app.route('/alarmEnabled', methods=['GET'])
def alarmEnabled():
    alarmEnabled = alarmClock.alarmEnabled
    return jsonify({'alarmEnabled': alarmEnabled}), 201


@app.route('/reset', methods=['POST'])
def reset():
    reset = request.args.get('reset')
    alarmClock.reset = int(reset)
    return jsonify({'reset': reset}), 201


@app.route('/changeAlarm', methods=['POST'])
def changeAlarm():
    changeAlarm = request.args.get('changeAlarm')
    alarmClock.changeAlarm = int(changeAlarm)
    return jsonify({'changeAlarm': changeAlarm}), 201


@app.route('/changeEnable', methods=['POST'])
def changeEnable():
    changeEnable = request.args.get('changeEnable')
    alarmClock.changeEnable = int(changeEnable)
    return jsonify({'changeEnable': changeEnable}), 201


@app.route('/alarmEnable', methods=['POST'])
def alarmEnable():
    alarmEnable = request.args.get('alarmEnable')
    alarmClock.alarmEnable = int(alarmEnable)
    return jsonify({'alarmEnable': alarmEnable}), 201


@app.route('/seconds1stDigitInc', methods=['POST'])
def seconds1stDigitInc():
    seconds1stDigitInc = request.args.get('seconds1stDigitInc')
    alarmClock.seconds1stDigitInc = int(seconds1stDigitInc)
    return jsonify({'seconds1stDigitInc': seconds1stDigitInc}), 201


@app.route('/seconds1stDigitDec', methods=['POST'])
def seconds1stDigitDec():
    seconds1stDigitDec = request.args.get('seconds1stDigitDec')
    alarmClock.seconds1stDigitDec = int(seconds1stDigitDec)
    return jsonify({'seconds1stDigitDec': seconds1stDigitDec}), 201


@app.route('/seconds2ndDigitInc', methods=['POST'])
def seconds2ndDigitInc():
    seconds2ndDigitInc = request.args.get('seconds2ndDigitInc')
    alarmClock.seconds2ndDigitInc = int(seconds2ndDigitInc)
    return jsonify({'seconds2ndDigitInc': seconds2ndDigitInc}), 201


@app.route('/seconds2ndDigitDec', methods=['POST'])
def seconds2ndDigitDec():
    seconds2ndDigitDec = request.args.get('seconds2ndDigitDec')
    alarmClock.seconds2ndDigitDec = int(seconds2ndDigitDec)
    return jsonify({'seconds2ndDigitDec': seconds2ndDigitDec}), 201


@app.route('/minutes1stDigitInc', methods=['POST'])
def minutes1stDigitInc():
    minutes1stDigitInc = request.args.get('minutes1stDigitInc')
    alarmClock.minutes1stDigitInc = int(minutes1stDigitInc)
    return jsonify({'minutes1stDigitInc': minutes1stDigitInc}), 201


@app.route('/minutes1stDigitDec', methods=['POST'])
def minutes1stDigitDec():
    minutes1stDigitDec = request.args.get('minutes1stDigitDec')
    alarmClock.minutes1stDigitDec = int(minutes1stDigitDec)
    return jsonify({'minutes1stDigitDec': minutes1stDigitDec}), 201


@app.route('/minutes2ndDigitInc', methods=['POST'])
def minutes2ndDigitInc():
    minutes2ndDigitInc = request.args.get('minutes2ndDigitInc')
    alarmClock.minutes2ndDigitInc = int(minutes2ndDigitInc)
    return jsonify({'minutes2ndDigitInc': minutes2ndDigitInc}), 201


@app.route('/minutes2ndDigitDec', methods=['POST'])
def minutes2ndDigitDec():
    minutes2ndDigitDec = request.args.get('minutes2ndDigitDec')
    alarmClock.minutes2ndDigitDec = int(minutes2ndDigitDec)
    return jsonify({'minutes2ndDigitDec': minutes2ndDigitDec}), 201


@app.route('/hours1stDigitInc', methods=['POST'])
def hours1stDigitInc():
    hours1stDigitInc = request.args.get('hours1stDigitInc')
    alarmClock.hours1stDigitInc = int(hours1stDigitInc)
    return jsonify({'hours1stDigitInc': hours1stDigitInc}), 201


@app.route('/hours1stDigitDec', methods=['POST'])
def hours1stDigitDec():
    hours1stDigitDec = request.args.get('hours1stDigitDec')
    alarmClock.hours1stDigitDec = int(hours1stDigitDec)
    return jsonify({'hours1stDigitDec': hours1stDigitDec}), 201


@app.route('/hours2ndDigitInc', methods=['POST'])
def hours2ndDigitInc():
    hours2ndDigitInc = request.args.get('hours2ndDigitInc')
    alarmClock.hours2ndDigitInc = int(hours2ndDigitInc)
    return jsonify({'hours2ndDigitInc': hours2ndDigitInc}), 201


@app.route('/hours2ndDigitDec', methods=['POST'])
def hours2ndDigitDec():
    hours2ndDigitDec = request.args.get('hours2ndDigitDec')
    alarmClock.hours2ndDigitDec = int(hours2ndDigitDec)
    return jsonify({'hours2ndDigitDec': hours2ndDigitDec}), 201
